DOCKER_IMAGE = k8s-tools

KUBERNETES_TOOLS := docker run \
		-ti \
		--rm \
		--network=host \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(PWD):/k8s \
		-v $(HOME)/.aws:/root/.aws \
        -v $(HOME)/.ssh:/root/.ssh \
        -v $(HOME)/.kube:/root/.kube \
        -e ENV=${ENV} \
		${DOCKER_IMAGE}

ps:
	docker ps

plan:
	${KUBERNETES_TOOLS} cd /k8s ; terraform init ; terraform plan -out ./plan.out

apply:
	${KUBERNETES_TOOLS} cd /k8s ; terraform apply ./plan.out