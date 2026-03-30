#!/bin/bash


until ping -c 1 github.com &>/dev/null; do sleep 1; done


curl -L "https://raw.githubusercontent.com/ТВОЙ_НИК/lemonovos/main/calamares-configs/bootloader.conf" -o /etc/calamares/modules/bootloader.conf


TARGET_DISK=$(lsblk -npdo NAME,TYPE | grep 'disk' | head -n 1 | awk '{print $1}')

if [ -n "$TARGET_DISK" ]; then
   
    echo "grubInstallDevice: \"$TARGET_DISK\"" >> /etc/calamares/modules/bootloader.conf
    echo "DEBUG: GRUB will be installed to $TARGET_DISK"
fi


sed -i 's/install_grub: false/install_grub: true/g' /etc/calamares/modules/grubcfg.conf


sed -i 's|supportUrl:.*|supportUrl: https://t.me/lemonovos|' /etc/calamares/modules/welcome.conf
