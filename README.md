# DevOps automation for Azure
AKS, Terraform, Helm, CI/CD, etc

## Prerequisites
### Dependencies
- Install Terraform https://developer.hashicorp.com/terraform/install
- Install Helm https://helm.sh/docs/intro/install/
### Azure
- Azure Subscription
- Resource Group
- SPN
- Storage Account and Container to store tfstate

## SPN IAM permissions
For the Subscription scope, set ```Contributor```for the SPN created

## Github Environments
- dev
- stage
- prod

## Github Secrets
For each Github Environment (dev, stage and prod) set the group of secrets

```
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
AZURE_CREDENTIALS
AZURE_CREDENTIALS
KUBECONFIG
MONGODB_CONNECTION_STRING
```
For ```AZURE_CREDENTIALS``` secret, follow the json format below
```
{
    "clientSecret": "",
    "subscriptionId": "",
    "tenantId": "",
    "clientId": ""
}
```

## Infra Pipeline
https://github.com/kalildevops/aks-template/actions/workflows/infra.yaml

## CI/CD pipeline
https://github.com/kalildevops/aks-template/actions/workflows/cicd.yaml

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
terraform plan -var-file="<env>.tfvars"
terraform apply
```