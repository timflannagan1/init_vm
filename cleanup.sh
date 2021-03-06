#! /usr/bin/bash

USAGE="./cleanup clean_storage_and_packages"

echo $USAGE

if [[ $# -eq 0 ]]
then
  sudo umount /opt/test*
  sudo lvremove /dev/mapper/*test* -y
  sudo wipefs -af /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf /dev/vdg /dev/vdh
  sudo emacs /etc/fstab
elif [ $1 == 1 ]
then
  sudo umount /opt/test*
  sudo lvremove /dev/mapper/*test* -y
  sudo emacs /etc/fstab
  sudo yum remove lvm2 e2fsprogs xfsprogs parted -y
fi
