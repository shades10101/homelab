create inventory file homelab-k8s with correct 

# Install NFS on a server of your choice

ansible -i homelab-k8s all -a "sudo apt-get install nfs-kernel-server -y" --become  

edit /etc/exports (add line):
/mnt/DataDrive/nfs *(rw,no_root_squash,insecure,async,no_subtree_check,anonuid=1000,anongid=1000)

## start nfs server:
ansible -i homelab-k8s all -a "sudo exportfs -ra" --become 


# Create NFS directories on workers
ansible -i homelab-k8s all -a "sudo apt install nfs-common -y" --become 
ansible -i homelab-k8s all -a "sudo mkdir /mnt/nfs" --become 
ansible -i homelab-k8s all -a "sudo chown -R shahid:shahid /mnt/nfs" --become 


# Configure auto-mount of the NFS Share

ansible -i homelab-k8s all -a "sed -i '$ a 10.0.0.250:/mnt/DataDrive/nfs   /mnt/nfs   nfs    rw  0  0' /etc/fstab" --become 

# Mount storage 

ansible -i homelab-k8s all -a "mount -a" --become 