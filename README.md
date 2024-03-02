# DevOps automation for Azure
AKS, Terraform, Helm, CI/CD, etc

## Prerequisites
### Dependencies
- Install Terraform https://developer.hashicorp.com/terraform/install
### Azure
- Azure Subscription
- Resource Group
- SPN
- Storage Account (Firewall enabled) and Container to store tfstate

## SPN permissions
Service: Service Account
Resource Name: tfstate<env>20240301
Role Assignments: Storage Account Contributor, Storage Account Key Operator Service Role
Reason: Necessary to execute terraform init


## Run Terraform locally  

Based in the SPN created, export the values below
```
export ARM_CLIENT_ID=< >
export ARM_CLIENT_SECRET=< > 
export ARM_SUBSCRIPTION_ID=< >
export ARM_TENANT_ID= < >
```
Init, Plan and Apply

```
cd iac/terraform/envs/<env>
terraform init
terraform plan
terraform apply
```