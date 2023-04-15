git:
	git pull

terraform-apply: git
	terraform init
	terraform apply -var-file=vars.tfvars -auto-approve

terraform-destroy:
	terraform destroy -var-file=vars.tfvars -auto-approve