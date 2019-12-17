#!/bin/bash

# terraform plan -var credentials=<credential_file_here> -var-file=testing.tfvars.json
terraform plan -var-file=testing.tfvars.json
