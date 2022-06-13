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

# Steps to create k8d homelab on proxmox
```
1) Create VM template, and set the correct name in tf-vars
2) Init terraofrm & apply: terraform apply -var-file="vars.tfvars"
3) Once that is done update hostnames and hosts file on server
4) Create proper inventory file for ansible
5) Run k8s cluster using k8s-init
Add worker: ansible-playbook -i ../../inventory/hosts -e VAULT_ubuntu_user='' main.yaml --ask-become-pass
```

# Join node to control plane
Run below on master

kubeadm token create --certificate-key
kubeadm token create --print-join-command --certificate-key

Get the output and run that on the new master. 