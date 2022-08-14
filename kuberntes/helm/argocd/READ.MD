# Install argoCD and servioce traffic using the LoadBalancer

kubectl create ns argocd

helm repo add bitnami https://charts.bitnami.com/bitnami

helm install argocd bitnami/argo-cd --set server.ingress.enabled=true --set server.service.type=LoadBalancer  -n argocd

# Execute the following commands to obtain the Argo CD credentials:

  echo "Username: \"admin\""
  echo "Password: $(kubectl -n argocd get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"