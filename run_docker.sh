#!/usr/bin/env bash

project_name=nd991_capstone

# Step 1:
# Build image and add a descriptive tag
docker build -t $project_name ./keras-flask-deploy-webapp

# Step 2:
# List docker images
docker image ls --filter "reference=$project_name"

# Step 3:
# Run flask app
docker run --rm -p 5000:5000 $project_name
