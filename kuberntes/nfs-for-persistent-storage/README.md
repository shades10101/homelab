# Install NFS on a server of your choice
 
sudo apt-get install nfs-kernel-server -y

edit /etc/exports (add line):
/mnt/DataDrive/nfs *(rw,no_root_squash,insecure,async,no_subtree_check,anonuid=1000,anongid=1000)

start nfs server:
sudo exportfs -ra

# Create NFS directories on workers

sudo apt install nfs-common -y
sudo mkdir /mnt/nfs
sudo chown -R shahid:shahid /mnt/nfs

# Configure auto-mount of the NFS Share

sudo vim /etc/fstab
10.0.0.50:/mnt/DataDrive/nfs   /mnt/nfs   nfs    rw  0  0

# Mount storage 

mount -a