#!/bin/bash


until ping -c 1 github.com &>/dev/null; do sleep 1; done

curl -L "https://raw.githubusercontent.com/Uofi113/Lemonovos/main/calamares-configs/bootloader.conf" -o /etc/calamares/modules/bootloader.conf
curl -L "https://raw.githubusercontent.com/Uofi113/Lemonovos/main/calamares-configs/packagechooser.conf" -o /etc/calamares/modules/packagechooser.conf


TARGET_DISK=$(lsblk -npdo NAME,TYPE | grep 'disk' | head -n 1 | awk '{print $1}')
if [ -n "$TARGET_DISK" ]; then
    echo "grubInstallDevice: \"$TARGET_DISK\"" >> /etc/calamares/modules/bootloader.conf
    echo "DEBUG: GRUB will be installed to $TARGET_DISK"
fi


sed -i '/- welcome/i \    - packagechooser' /etc/calamares/settings.conf


sed -i 's/install_grub: false/install_grub: true/g' /etc/calamares/modules/grubcfg.conf


sed -i 's|supportUrl:.*|supportUrl: https://t.me/lemonovos|' /etc/calamares/modules/welcome.conf


cat <<EOF > /etc/calamares/modules/services-systemd.conf
---
units:
  - name: "networkipp"
    action: "enable"
  - name: "NetworkManager"
    action: "enable"
  - name: "sshd"
    action: "enable"
# В зависимости от выбора в packagechooser, Calamares сам поймет, какой DM включить,
# если пакеты sddm и gdm помечены в packagechooser.conf
EOF

echo "✅ LemonovOS Remote Fix Applied!"
