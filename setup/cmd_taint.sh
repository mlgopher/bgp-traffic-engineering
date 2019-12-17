#!/bin/bash

# terraform plan -var credentials=<credential_file_here> -var-file=testing.tfvars.json
terraform taint -var-file=testing.tfvars.json null_resource.ansible
