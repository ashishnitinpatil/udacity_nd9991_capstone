cluster-create:
	eksctl create cluster --config-file=eks-cluster-config.yaml

cluster-info:
	kubectl cluster-info

cluster-delete:
	eksctl delete cluster --config-file=eks-cluster-config.yaml
