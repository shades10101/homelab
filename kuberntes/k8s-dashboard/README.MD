# Install dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml

# Verify pods are running
kubectl get pods -n kubernetes-dashboard

# Create admin-user to connect kubernetes-dashboard
see serviceAccount.yaml

# Retrieve the unique access token of admin-user
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

Copy the token value

# connect to dashboard
kubectl proxy

go to:

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

select token and paste to login.

- Having issues here i will have to come back to this. 