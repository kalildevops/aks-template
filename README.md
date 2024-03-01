# DevOps automation for Azure
AKS, Terraform, Helm, CI/CD, etc

## Get Azure Credentials
```
az login
az account set --subscription "<subscription_id>"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscription_id>" > $HOME/azure_creds_<env>.json
cat $HOME/azure_creds_<env>.json

export ARM_CLIENT_ID=$(jq '.appId' $HOME/azure_creds_<env>.json |sed 's/"//g')
export ARM_CLIENT_SECRET=$(jq '.password' $HOME/azure_creds_<env>.json |sed 's/"//g')
export ARM_SUBSCRIPTION_ID=<subscription_id>
export ARM_TENANT_ID=$(jq '.tenant' $HOME/azure_creds_<env>.json |sed 's/"//g')

env |grep ARM
```