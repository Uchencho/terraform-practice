start-local-stack:
	docker run --rm -it -p 4566:4566 -v /var/run/docker.sock:/var/run/docker.sock localstack/localstack

.PHONY: show-plan
show-plan:
	terraform show plan.tfplan

plan:
	terraform plan -out=plan.tfplan

plan-dev:
	terraform plan -var-file=dev.tfvars -out=plan.tfplan

apply-plan:
	terraform apply plan.tfplan

init:
	terraform init # Used when a new module is added

clean:
	terraform destroy -var-file=dev.tfvars