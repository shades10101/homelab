# Install provioner:
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
   --set nfs.server=10.0.0.250 \
   --set nfs.path=/mnt/DataDrive/nfs 
