# Create metallb namespace
kubectl create namespace metallb

# Install MetalLB
helm install metallb metallb/metallb -f values.yaml --namespace metallb

# Verify installation:
kubectl get configmap metallb -o yaml -n metallb -n metallb

# Example of creating service that can use metallb
look at example_service.yaml