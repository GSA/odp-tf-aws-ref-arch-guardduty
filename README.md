# odp-tf-aws-ref-arch-guardduty

## Overview <a name="s1"></a>

The `odp-tf-aws-ref-arch-guardduty`  module is used to configure X resources.

## Table of Contents <a name="s2"></a>

* [Overview](#s1)
* [Table of Conents](#s2)
* [Module Contents](#s3)
* [Module Variables](#s4)
* [Module Setup](#s5)
* [Resources Created](#s6)


## Module Contents <a name="s3"></a>


| Folder / File      |  Description  |
|---          |---    |
| main.tf   |   Main Terraform code |
| kms.tf   |   KMS  code |
| s3.tf   |   S3 Bucket  code |
| versions.tf   |   Main Terraform code |
| variables.tf   |   Required Variables |
| output.tf   |   Output variables |
| guardduty.tfvars   |   tfvars file  |
| files/bucket_policy.tpl      |  Bucket policy code |
| .circleci   | CI Pipeline code for validating module.  Requires working example in `example` directory. |


## Module Variables  <a name="s4"></a>


### Inputs

The following variables need to be set either by setting proper environment variables or editing the variables.tf file:

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| guardduty_bucket_name | string | S3 Bucket for Guardduty finidngs |
| guardduty_bucket_acl | string | ACL value ex: log-delivery-write |
| guardduty_bucket_destroy | bool | (True/False) |
| guardduty_bucket_enable_versioning | bool | (True/False) |
| guardduty_bucket_block_public_acls | bool | (True/False) |
| guardduty_bucket_ignore_public_acls | bool | (True/False) |
| guardduty_bucket_block_public_policy | bool | (True/False) |
| guardduty_bucket_restrict_public_buckets | bool | (True/False) |



### Outputs

The following variables need to be set either by setting proper environment variables or editing the variables.tf file:

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
|  guardduty_bucket_arn |  string | GuardDuty bucket S3 arn  |
|  guardduty_bucket_id |  string |  GuardDuty bucket S3 id  |

## Module Setup <a name="s5"></a>

### To invoke this module

---- TBD ---- TO DO ------

#### If we need to run this module indepdently then use the below commands

terraform init -var-file=guardduty.tfvars<br>
terraform validate<br>
terraform plan -var-file=guardduty.tfvars<br>
terraform apply -var-file=guardduty.tfvars -auto-approve

#### to destroy

terraform apply -var-file=guardduty.tfvars


## Resources Created <a name="s6"></a>

### KMS

KMS key with alias as guardduty will be created and guard duty policy will be attached to the KMS policy

### S3 Bucket

S3 Bucket will be created and S3 bucket policy will be attached so guardduty findings can export

### GuardDuty detector

Guardduty will be enabled and detector will enable


### Findings export options

Findings export options will be enabled

