[master]
${k8s_master} ansible_user=

[workers]
${k8s_workers} ansible_user=

[k3s_cluster:children]
master
worker

[all:vars]
ansible_python_interpreter=/usr/bin/python3