#!/usr/bin/env bash
systemctl stop reflector.service
timedatectl set-ntp true
timedatectl status

cat << EOF > /etc/pacman.d/mirrorlist
Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
EOF

cat << EOF >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist

[archlinuxcn]
Server = https://repo.archlinuxcn.org/\$arch
EOF

pacman -Syu haveged
systemctl start haveged
systemctl enable haveged

rm -fr /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux

# modprobe dm-crypt
# modprobe dm-mod
# 1. /boot/efi: 512M 
# 2. /boot: 4G 
# 3. /: 255G 
# 4. /home:left_space
## encrypt root partition
# cryptsetup luksFormat -v -s 512 -h sha512 /dev/nvme0n1p3
## enter(Uppercase): YES
## type passphrase
## encrypt home partition
# cryptsetup luksFormat -v -s 512 -h sha512 /dev/nvme0n1p4
## enter(Uppercase): YES
## type passphrase
# cryptsetup open /dev/nvme0n1p3 luks_lvm
## type passphrase
# pvcreate /dev/mapper/luks_lvm
# vgcreate arch /dev/mapper/luks_lvm
# lvcreate -n root -l +100%FREE arch
# cryptsetup open /dev/nvme0n1p4 arch-home
# mkfs.fat -F32 /dev/nvme0n1p1 # /boot/efi
# mkfs.ext4 /dev/nvme0n1p2 # /boot
# mkfs.btrfs -L root /dev/mapper/arch-root # /
# mkfs.btrfs -L home /dev/mapper/arch-home # /home
# mount /dev/mapper/arch-root /mnt # /
# mkdir -p /mnt/{boot,home}
# mount /dev/nvme0n1p2 /mnt/boot # /boot
# mount /dev/mapper/arch-home /mnt/home # /home
# mkdir -p /mnt/boot/efi
# mount /dev/nvme0n1p1 /mnt/boot/efi
# lsblk

pacstrap /mnt base base-devel linux linux-headers linux-firmware \
	sudo dhcpcd iwd neovim zsh \
	lvm2 amd-ucode grub efibootmgr

genfstab -U -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt

# /etc/mkinitcpio.conf
# HOOKS=( ... block encrypt lvm2 filesystems ...)

grub-install --efi-directory=/boot/efi

# /etc/default/grub
## UUID:
## `blkid /dev/nvme0n1p3 | awk '{ print $2 }' | tr -d \"` # / partition UUID
# GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet [root=/dev/mapper/arch-root  cryptdevice=UUID=c16a5515-93c3-436a-b790-79a963e2c5d9]:luks_lvm]"

# mkdir /secure
# dd if=/dev/random of=/secure/root_keyfile.bin bs=512 count=8
# dd if=/dev/random of=/secure/home_keyfile.bin bs=512 count=8
# chmod 000 /secure/*
# chmod 600 /boot/initramfs-linux*
# cryptsetup luksAddKey /dev/nvme0n1p3 /secure/root_keyfile.bin # /
## type passphrase
# cryptsetup luksAddKey /dev/nvme0n1p4 /secure/home_keyfile.bin # /home
## type passphrase

# /etc/mkinitcpio.conf
# FILES=( /secure/root_keyfile.bin )

# /etc/crypttab
## UUID:
## `blkid /dev/nvme0n1p4 | awk '{ print $2 }' | tr -d \"` # /home partition UUID
# arch-home      UUID=bb3821ab-4290-4f68-8ecb-8d5eea6174c7  /secure/home_keyfile.bin

# mkinitcpio -p linux

grub-mkconfig -o /boot/grub/grub.cfg
grub-mkconfig -o /boot/efi/EFI/arch/grub.cfg

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8'  > /etc/locale.conf
echo 'archlinux' > /etc/hostname

passwd root
useradd -m -g users -G wheel -s /bin/zsh warpaint && \
passwd warpaint

EDITOR=nvim
visudo

cat << EOF >> /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.1.1   arch
185.199.108.133   raw.githubusercontent.com
185.199.109.133   raw.githubusercontent.com
185.199.110.133   raw.githubusercontent.com
185.199.111.133   raw.githubusercontent.com
EOF

cat << EOF >> /etc/resolv.conf
nameserver 8.8.8.8
nameserver 2001:4860:4860::8888
nameserver 8.8.4.4
nameserver 2001:4860:4860::8844
EOF

cat << EOF >> /etc/environment
GTK_IM_MODULE=fcitx5
QT_IM_MODULE=fcitx5
XMODIFIERS=@im=fcitx5
INPUT_METHOD=fcitx5
SDL_IM_MODULE=fcitx5
GLFW_IM_MODULE=ibus
_JAVA_AWT_WM_NONREPARENTING=1
EOF

chattr +i /etc/resolv.conf
hwclock --systohc

pacman-key --lsign-key "farseerfc@archlinux.org"
pacman -S archlinuxcn-keyring

pacman -S yay git

yay -S xorg xorg-xinit \
	xdg-user-dirs xclip xautolock i3lock \
	alacritty firefox-esr google-chrome \
	fcitx5-im fcitx5-chinese-addons fcitx5-material-color \
	alsa-utils pavucontrol apulse sof-firmware alsa-firmware alsa-ucm-conf \
	mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau \
	zsh-syntax-highlighting zsh-autosuggestions \
	ntfs-3g hplip cups \
	bluez bluez-utils bluez-obex \
	screenkey fzf ranger feh rofi blueman networkmanager network-manager-applet \
	jre11-openjdk jre11-openjdk-headless make cmake \
	w3m ueberzug evince-no-gnome yesplaymusic \
	powerline-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
	ttf-nerd-fonts-symbols  ttf-victor-mono-nerd \
	unzip rar flameshot obs-studio \
	thunar xfce4-panel xfce4-power-manager xfce4-pulseaudio-plugin \
	virtualbox6.1-bin virtualbox6.1-bin-guest-iso virtualbox6.1-ext-oracle &

systemctl enable dhcpcd
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups

# su warpaint
# cd ~
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
# 
# mkdir -p ~/.local
# cd ~/.local
# 
# git clone https://github.com/warpaint9299/archlinux.git && \
# ln -sf ~/.local/archlinux/alacritty ~/.conf/alacritty
# ln -sf ~/.local/archlinux/picom ~/.conf/picom
# ln -sf ~/.local/archlinux/powerline/powerline.zsh-theme ~/.oh-my-zsh/themes/powerline.zsh-theme
# ln -sf ~/.local/archlinux/oh-my-zsh/zshrc ~/.zshrc
# 
# git clone https://github.com/warpaint9299/nvim-0.9 && \
# ln -sf ~/.local/nvim-0.9 ~/.config/nvim
# 
# git clone https://github.com/warpaint9299/dwm-6.4 && \
# ln -sf ~/.local/dwm-6.4 ~/.dwm
# ln -sf ~/.local/dwm-6.4/.xinitrc ~/.xinitrc
# sudo make clean install
# 
# git clone https://github.com/warpaint9299/st-0.9
# sudo make clean install
#
# git clone https://github.com/warpaint9299/wallpaper && \
# ln -sf ~/.local/wallpaper ~/.wallpaper

# exit
# umount -R /mnt
