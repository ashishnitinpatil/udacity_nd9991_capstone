all: image-upload cluster-create cluster-info deploy expose service-info

image-upload:
	./upload_docker.sh

cluster-create:
	eksctl create cluster --config-file=eks-cluster-config.yaml

cluster-info:
	kubectl cluster-info

cluster-delete:
	eksctl delete cluster --config-file=eks-cluster-config.yaml

deploy:
	kubectl apply -f kubernetes.yaml

expose:
	kubectl expose deployment nd991-capstone-deployment --type=LoadBalancer --name=nd991-capstone-loadbalancer

service-info:
	kubectl get service/nd991-capstone-loadbalancer

rollout-info:
	kubectl rollout status deployment/nd991-capstone-deployment
