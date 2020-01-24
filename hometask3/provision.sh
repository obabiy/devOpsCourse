sudo apt-get install lvm2

sudo pvcreate -f /dev/sdc /dev/sdd /dev/sde /dev/sdf
sudo vgcreate -f vg00 /dev/sdc /dev/sdd /dev/sde /dev/sdf
sudo lvcreate -n vol1 -L 600M vg00
sudo lvcreate -n vol2 -l 100%FREE vg00

mkfs.ext4 /dev/vg00/vol1
mkfs.ext4 /dev/vg00/vol2

sudo mkdir /mnt/vol1
sudo mkdir /mnt/vol2 

sudo mount -v /dev/mapper/vg00-vol1 /mnt/vol1
sudo mount -v /dev/mapper/vg00-vol2 /mnt/vol2

lsblk