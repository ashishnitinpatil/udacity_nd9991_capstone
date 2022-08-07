#!/usr/bin/env bash

project_name="nd991_capstone"
aws_region="us-east-1"
ecrpath="541016292997.dkr.ecr.$aws_region.amazonaws.com"
dockerpath="$ecrpath/$project_name"
echo $dockerpath

# Assuming you've started minikube
deployment_name="nd991-capstone-deployment"

# Step 0
# Authenticate to access our private ECR repo
kubectl create secret docker-registry regcred \
  --docker-server=$ecrpath \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --profile udacity --region $aws_region)

kubectl get nodes
kubectl apply -f kubernetes.yaml

kubectl port-forward deploy/$deployment_name 5000:5000

# cleanup
# kubectl delete deploy nd991-capstone-deployment
# kubectl delete secret regcred
