![stability-wip](https://img.shields.io/badge/stability-work_in_progress-lightgrey.svg)

# Terraform VPC Module

The project was created to learn more about terraformAWS VPC modules.
Feel free to contribute.

## Requeriments
   * [**AWS Account**](https://console.aws.amazon.com)
   * [**AWS Cli:**](http://docs.aws.amazon.com/pt_br/cli/latest/userguide/installing.html)
   * [**Terraform**](https://www.terraform.io/)
   * [**Terrform AWS Module**](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/1.14.0)

## Running the example

### Terraform
#### Create your terraform.tfvars
```
cp terraform.tfvars.example terraform.tfvars
```
#### Download and install modules for the configuration
```
$ terraform init
```
#### Generate and show an execution plan
```
$ terraform plan -var-file="terraform.tfvars"
```
#### Builds or changes infrastructure
```
$ terraform apply -var-file="terraform.tfvars"
```
#### Read an output from a state file
```
$ terraform output
```
## Docs
 * **Terraform Getting Started:** https://www.terraform.io/intro/index.html)

# TODO
* ** Add subnet private option**
* ** Try m**
* **Create infrastructure Traefik**
