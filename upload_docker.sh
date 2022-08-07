#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that you have already created an ECR repo & added permissions
# https://stackoverflow.com/a/72621029/2689986

# Step 1:
# Create dockerpath
project_name="nd991_capstone"
aws_region="us-east-1"
ecrpath="541016292997.dkr.ecr.$aws_region.amazonaws.com"
dockerpath="$ecrpath/$project_name"
echo $dockerpath

# Step 2:
# Authenticate & tag
aws ecr get-login-password --profile udacity --region $aws_region | docker login --username AWS --password-stdin $ecrpath

# Step 3:
# Build docker image
docker build -t $project_name ./keras-flask-deploy-webapp

# Step 4:
# Tag it and bag it
echo "Please enter current version tag"
read version
echo "Tagging image as 'latest' and '$version'"
docker image tag $project_name $dockerpath:latest
docker image tag $project_name $dockerpath:$version

# Step 4:
# Push image to ECR repository
docker push $dockerpath:latest
docker push $dockerpath:$version
