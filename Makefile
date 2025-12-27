start-local-stack:
	docker run --rm -it -p 4566:4566 -v /var/run/docker.sock:/var/run/docker.sock localstack/localstack

.PHONY: show-plan
show-plan:
	terraform show plan.tfplan
