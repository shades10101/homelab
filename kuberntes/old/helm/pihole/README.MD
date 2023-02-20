# Create namespace
$ kubectl create namespace pihole

# Cerate PV & PVC
see attached yamls

# Install helm repo
$ helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/ && helm repo update

# Create password
kubectl create secret generic pihole-secret \
    --from-literal='password=<ADMIN_PASSWORD>' \
    --namespace pihole

# Download the chart values locally
helm show values mojo2600/pihole >> values.yml

# Made changed to:
-  ServiceWeb
-  ServiceDns
-  Utilizing metallb LB
-  Using PV / PVC

# Install chart:

helm install pihole mojo2600/pihole \
  --namespace pihole \
  --values values.yml

# Install ingress
- See pihole-ingress.yml