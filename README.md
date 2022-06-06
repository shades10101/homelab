# homelab

# Add a drive to proxmox
lsblk
- Find new drive for below ###
parted /dev/### mklabel gpt
parted -a opt /dev/### mkpart primary ext4 0% 100%
mkfs.ext4 -L storageprox /dev/###1
mkdir -p /mnt/data
vim /etc/fstab
Add this:    LABEL=NAME_IT /mnt/data ext4 defaults 0 2
mount -a
Now in the Proxmox GUI go to Datacenter -> Storage -> Add -> Directory.
Add directory path, and choose the content, this will set what goes to the drives. 

