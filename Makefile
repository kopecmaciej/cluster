TERRAFORM_FOLDER=terraform

.PHONY: init plan apply validate destroy

plan:
	terraform -chdir=$(TERRAFORM_FOLDER) plan

apply:
	terraform -chdir=$(TERRAFORM_FOLDER) apply --auto-approve

validate:
	terraform -chdir=$(TERRAFORM_FOLDER) validate

destroy:
	echo "Do you really want to destroy all resources? [y/N] " && read ans && [ $${ans:-N} = y ]
	terraform -chdir=$(TERRAFORM_FOLDER) destroy --auto-approve
