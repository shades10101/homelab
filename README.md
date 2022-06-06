# homelab
In this repo you can run Terraform to create k8s cluster that has 1 master and 3 workers. Ansible playbook to automate the creation of the kubernetes cluster. And finally a collection of yamls/helm values that I used to create applications (pihole, metalLB, nginx-ingress, pv, pvcs, storageclasses, etc. ) and configurations on my cluster.


# Add a drive to proxmox
```
lsblk
Find new drive for below ###
parted /dev/### mklabel gpt
parted -a opt /dev/### mkpart primary ext4 0% 100%
mkfs.ext4 -L storageprox /dev/###1
mkdir -p /mnt/data
vim /etc/fstab
Add this:    LABEL=NAME_IT /mnt/data ext4 defaults 0 2
mount -a
Now in the Proxmox GUI go to Datacenter -> Storage -> Add -> Directory.
Add directory path, and choose the content, this will set what goes to the drives. 
```
