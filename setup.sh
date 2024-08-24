#!/usr/bin/env bash

systemctl stop reflector.service
timedatectl set-ntp true
timedatectl status

cat << EOF > /etc/pacman.d/mirrorlist
## China
Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.bfsu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.cqu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.hit.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.jlu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.jxust.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.neusoft.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.nju.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.njupt.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirror.nyist.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.qlu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirror.redrock.team/archlinux/\$repo/os/\$arch
Server = https://mirrors.shanghaitech.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.wsyu.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.xjtu.edu.cn/archlinux/\$repo/os/\$arch

## Hong Kong
Server = https://asia.mirror.pkgbuild.com/\$repo/os/\$arch
Server = https://mirror-hk.koddos.net/archlinux/\$repo/os/\$arch
Server = https://hkg.mirror.rackspace.com/archlinux/\$repo/os/\$arch
Server = https://arch-mirror.wtako.net/\$repo/os/\$arch
Server = https://mirror.xtom.com.hk/archlinux/\$repo/os/\$arch

## Taiwan
Server = https://mirror.archlinux.tw/ArchLinux/\$repo/os/\$arch
Server = https://free.nchc.org.tw/arch/\$repo/os/\$arch
Server = https://ncuesaweb.ncue.edu.tw/linux/archlinux/\$repo/os/\$arch
Server = https://archlinux.cs.nycu.edu.tw/\$repo/os/\$arch
Server = https://ftp.yzu.edu.tw/Linux/archlinux/\$repo/os/\$arch

## Japan
Server = https://mirrors.cat.net/archlinux/\$repo/os/\$arch
Server = https://jp.mirrors.cicku.me/archlinux/\$repo/os/\$arch
Server = https://ftp.jaist.ac.jp/pub/Linux/ArchLinux/\$repo/os/\$arch
Server = https://repo.jing.rocks/archlinux/\$repo/os/\$arch
Server = https://mirror.nishi.network/archlinux/\$repo/os/\$arch
Server = https://mirror.saebasol.org/archlinux/\$repo/os/\$arch

## United States
Server = https://mirror.adectra.com/archlinux/\$repo/os/\$arch
Server = https://mirror.arizona.edu/archlinux/\$repo/os/\$arch
Server = https://arlm.tyzoid.com/\$repo/os/\$arch
Server = https://mirror.ava.dev/archlinux/\$repo/os/\$arch
Server = https://mirrors.bjg.at/arch/\$repo/os/\$arch
Server = https://mirrors.bloomu.edu/archlinux/\$repo/os/\$arch
Server = https://us.mirrors.cicku.me/archlinux/\$repo/os/\$arch
Server = https://mirror.clarkson.edu/archlinux/\$repo/os/\$arch
Server = https://arch.mirror.constant.com/\$repo/os/\$arch
Server = https://mirror.cybersecurity.nmt.edu/archlinux/\$repo/os/\$arch
Server = https://mirror.ette.biz/archlinux/\$repo/os/\$arch
Server = https://codingflyboy.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://coresite.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://forksystems.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://irltoolkit.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://mirror.fcix.net/archlinux/\$repo/os/\$arch
Server = https://mnvoip.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://nnenix.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://nocix.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://ohioix.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://opencolo.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://ridgewireless.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://southfront.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://uvermont.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://volico.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://ziply.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://america.mirror.pkgbuild.com/\$repo/os/\$arch
Server = https://arch.goober.cloud/\$repo/os/\$arch
Server = https://mirror.hackingand.coffee/arch/\$repo/os/\$arch
Server = https://mirror.hodgepodge.dev/archlinux/\$repo/os/\$arch
Server = https://mirror.hostup.org/archlinux/\$repo/os/\$arch
Server = https://arch.hu.fo/archlinux/\$repo/os/\$arch
Server = https://repo.ialab.dsu.edu/archlinux/\$repo/os/\$arch
Server = https://mirrors.iu13.net/archlinux/\$repo/os/\$arch
Server = https://arch.mirror.ivo.st/\$repo/os/\$arch
Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch
Server = https://mirror.dal10.us.leaseweb.net/archlinux/\$repo/os/\$arch
Server = https://mirror.mia11.us.leaseweb.net/archlinux/\$repo/os/\$arch
Server = https://mirror.sfo12.us.leaseweb.net/archlinux/\$repo/os/\$arch
Server = https://mirror.wdc1.us.leaseweb.net/archlinux/\$repo/os/\$arch
Server = https://mirror.lty.me/archlinux/\$repo/os/\$arch
Server = https://mirrors.lug.mtu.edu/archlinux/\$repo/os/\$arch
Server = https://m.lqy.me/arch/\$repo/os/\$arch
Server = https://archlinux.macarne.com/\$repo/os/\$arch
Server = https://mirror.kaminski.io/archlinux/\$repo/os/\$arch
Server = https://iad.mirrors.misaka.one/archlinux/\$repo/os/\$arch
Server = https://mirrors.mit.edu/archlinux/\$repo/os/\$arch
Server = https://mirrors.ocf.berkeley.edu/archlinux/\$repo/os/\$arch
Server = https://archmirror1.octyl.net/\$repo/os/\$arch
Server = https://ftp.osuosl.org/pub/archlinux/\$repo/os/\$arch
Server = https://dfw.mirror.rackspace.com/archlinux/\$repo/os/\$arch
Server = https://iad.mirror.rackspace.com/archlinux/\$repo/os/\$arch
Server = https://ord.mirror.rackspace.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.radwebhosting.com/archlinux/\$repo/os/\$arch
Server = https://plug-mirror.rcac.purdue.edu/archlinux/\$repo/os/\$arch
Server = https://mirrors.rit.edu/archlinux/\$repo/os/\$arch
Server = https://mirrors.rutgers.edu/archlinux/\$repo/os/\$arch
Server = https://mirrors.sonic.net/archlinux/\$repo/os/\$arch
Server = https://mirror.phx1.us.spryservers.net/archlinux/\$repo/os/\$arch
Server = https://arch.mirror.square-r00t.net/\$repo/os/\$arch
Server = https://mirror.stjschools.org/arch/\$repo/os/\$arch
Server = https://ftp.sudhip.com/archlinux/\$repo/os/\$arch
Server = https://mirror.pit.teraswitch.com/archlinux/\$repo/os/\$arch
Server = https://mirror.the-repo.org/ArchMirror/\$repo/os/\$arch
Server = https://mirror.theash.xyz/arch/\$repo/os/\$arch
Server = https://mirror.tmmworkshop.com/archlinux/\$repo/os/\$arch
Server = https://mirror.umd.edu/archlinux/\$repo/os/\$arch
Server = https://mirrors.vectair.net/archlinux/\$repo/os/\$arch
Server = https://mirrors.xtom.com/archlinux/\$repo/os/\$arch
Server = https://mirror.zackmyers.io/archlinux/\$repo/os/\$arch
Server = https://zxcvfdsa.com/arch/\$repo/os/\$arch
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

rm -rf /etc/pacman.d/gnupg
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

pacstrap /mnt base base-devel linux-lts linux-lts-headers linux-firmware \
	sudo dhcpcd iwd neovim zsh \
	lvm2 btrfs-progs amd-ucode grub efibootmgr

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

yay -S xorg xorg-xinit xorg-xrdb \
	xorg-xprop xdg-user-dirs xclip xdotool xautolock arandr i3lock xorg-server-xephyr \
	alacritty alacritty-theme-git firefox google-chrome downgrade \
	fcitx5-im fcitx5-chinese-addons fcitx5-material-color \
	alsa-utils pavucontrol apulse sof-firmware alsa-firmware alsa-ucm-conf \
	mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau \
	ntfs-3g hplip cups iptables man man-pages goldendict-ng-git \
	bluez bluez-utils bluez-obex \
	screenkey fzf ranger tmux feh rofi btop picom-simpleanims-git blueman networkmanager network-manager-applet lsd fd \
	jdk11-openjdk jre11-openjdk-headless make cmake \
	stow zoxide w3m catdoc docx2txt mediainfo highlight ueberzug okular ebook-tools kdegraphics-mobipocket xchm cowsay cmatrix cava \
	translate-shell yesplaymusic tigervnc-viewer \
	adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts \
	powerline-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
	ttf-nerd-fonts-symbols ttf-victor-mono-nerd ttf-fantasque-nerd \
	ttf-comic-mono-git kitty \
	ripgrep unzip rar p7zip flameshot obs-studio \
	thunar mousepad xfce4-panel xfce4-power-manager xfce4-pulseaudio-plugin xfce4-wavelan-plugin \
	texlive-basic texlive-latex texlive-latexrecommended texlive-latexextra texlive-fontsrecommended  texlive-fontsextra  texlive-xetex  texlive-luatex texlive-bibtexextra texlive-mathscience texlive-langchinese texlive-langenglish texlive-langjapanese \
	virtualbox6.1-bin virtualbox6.1-bin-guest-iso virtualbox6.1-ext-oracle &

systemctl enable dhcpcd
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable iptables
systemctl enable cups

# su warpaint
# cd ~
# mkdir -p ~/{.config, .local}
#
# git clone https://github.com/warpaint9299/dotfiles.git ~/.dotfiles && \
# cd ~/.dotfiles
# stow .
#
# cd ~/.dwm
# sudo make clean install
#
# cd ~/.st
# sudo make clean install
#
# exit
# umount -R /mnt
