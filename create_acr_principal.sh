#!/bin/bash

# Modify for your environment.
# ACR_NAME: The name of your Azure Container Registry
# SERVICE_PRINCIPAL_NAME: Must be unique within your AD tenant
ACR_NAME=mygroupname
SERVICE_PRINCIPAL_NAME=acr-service-principal

# Obtain the full registry ID for subsequent command args
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)

# Create the service principal with rights scoped to the registry.
# Default permissions are for docker pull access. Modify the '--role'
# argument value as desired:
# acrpull:     pull only
# acrpush:     push and pull
# owner:       push, pull, and assign roles
SP_PASSWD=$(az ad sp create-for-rbac --name http://$SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query password --output tsv)
SP_APP_ID=$(az ad sp show --id http://$SERVICE_PRINCIPAL_NAME --query appId --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "Service principal ID: $SP_APP_ID"
echo "Service principal password: $SP_PASSWD"

ACR_REGISTRY_ID = /subscriptions/23548e35-7266-497e-8ce6-4a04668181c3/resourceGroups/MyGroup/providers/Microsoft.ContainerRegistry/registries/mygroupname
SP_PASSWD = iT-TyTl-uzx5sUYMzDh2dvCA3A7FKkMZIG
SP_APP_ID = 2b3f3e1c-51ef-4ec2-bae4-63630cfb30eb


az ad sp create-for-rbac --name http://acr-service-principal --scopes /subscriptions/23548e35-7266-497e-8ce6-4a04668181c3/resourceGroups/MyGroup/providers/Microsoft.ContainerRegistry/registries/mygroupname --role acrpull --query password --output tsv


az ad sp show --id http://acr-service-principal --query appId --output tsv