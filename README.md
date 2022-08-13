[![CircleCI](https://dl.circleci.com/status-badge/img/gh/ashishnitinpatil/udacity_nd9991_capstone/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/ashishnitinpatil/udacity_nd9991_capstone/tree/master)

## Project Overview

In this project I will apply the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:

* Working in AWS
* Using Circle CI to implement Continuous Integration and Continuous Deployment
* Building pipelines
* Working with Ansible and CloudFormation
* Building Kubernetes clusters
* Building Docker containers in pipelines

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2577/view).

---

### Running `app.py`

1. Run in Docker:  `./run_docker.sh`
2. Run in Kubernetes:  
  - `./upload_docker.sh`
  - `./run_kubernetes.sh`

### Create AWS EKS Cluster

We will use [eksctl](https://eksctl.io/) to create an AWS EKS Cluster, which in itself uses AWS Cloudformation.

Run via make - `make cluster-create`  
To check on cluster status - `make cluster-info`  
Cleanup cluster - `make cluster-delete`  

### Deploy application to AWS EKS

Our application logic resides in [kubernetes.yaml](./kubernetes.yaml), which sets up a Kubernetes loadbalancer service that balances our pods containing the flask app.  

Command to deploy - `make deploy`  

Once deployment is successful, we need to expose our loadbalancer to public, so that anyone can nicely open up our deployed service in a web browser.  

To make our deployment public - `make expose`  
And then to fetch the DNS of our load balancer - `make service-info`  

Copy the "external-ip" from the above output and fire up in your browser.

### Screenshots

See the [screenshots](./screenshots) directory for screenshots of my Circle CI pipeline runs, deployment status and successfully hosted web application.
