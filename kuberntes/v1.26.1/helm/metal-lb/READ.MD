# Helm repo
helm repo add metallb https://metallb.github.io/metallb
helm install metallb metallb/metallb

# If you’re using kube-proxy in IPVS mode, since Kubernetes v1.14.2 you have to enable strict ARP mode.

```

# see what changes would be made, returns nonzero returncode if different
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system

# actually apply the changes, returns nonzero returncode on errors only
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

```

Add labels:
```
  labels:
    pod-security.kubernetes.io/enforce: privileged
    pod-security.kubernetes.io/audit: privileged
    pod-security.kubernetes.io/warn: privileged

kubectl label namespaces metallbs-systempod-security.kubernetes.io/enforce=privileged --overwrite=true
kubectl label namespaces metallbs-system pod-security.kubernetes.io/audit=privileged --overwrite=true
kubectl label namespaces metallbs-system pod-security.kubernetes.io/warn=privileged --overwrite=true

```

# Install with helm
helm install metallb metallb/metallb --namespace metallb-system

# Apply layer 2 configurations 
kubectl apply -f layer-two-config.yaml -n metallb-system