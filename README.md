# odp-tf-aws-ref-arch-guardduty

## if we need to run this module indepdently then use the below commands

terraform init -var-file=guardduty.tfvars
terraform validate
terraform plan -var-file=guardduty.tfvars
terraform apply -var-file=guardduty.tfvars -auto-approve

### to destroy

terraform apply -var-file=guardduty.tfvars
