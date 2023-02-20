# How to

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm inspect values prometheus-community/kube-prometheus-stack > values.yaml

I changed just adminPassword in values.yaml

helm install prometheus-community/kube-prometheus-stack \
--create-namespace --namespace prometheus \
--generate-name \
--values /home/shahid/helm/monitoring/values.yaml \
--set prometheus.service.type=LoadBalancer \
--set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false \
--set grafana.service.type=LoadBalancer