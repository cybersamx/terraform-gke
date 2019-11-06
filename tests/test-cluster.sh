#!/usr/bin/env bash

# Deploy the helloworld backend to the cluster. Create a hello deployment.
kubectl apply -f hello-backend.yaml

# Verify the deployment
kubectl describe deployment hello

# Create a service for the frontend to connect to the backend. Create a hello service.
kubectl apply -f hello-backend-service.yaml

# Deploy the helloworld frontend to the cluster. For this application, it has both
# k8s deployment and service.
kubectl apply -f hello-frontend.yaml

# Get the external IP address to connect to the frontend
cat <<EOF
It takes a while for an external IP address to be allocated. Run the following command to check the status:
kubectl get service frontend --watch
Once the external IP address has been allocated, run the following command to test the connection:
curl "http://$(kubectl get service frontend | awk 'FNR==2 {print $4}')"
EOF