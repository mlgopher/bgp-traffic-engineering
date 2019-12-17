#!/bin/bash

# terraform apply -var credentials=<credential_file_here> -var-file=testing.tfvars.json
terraform apply -var-file=testing.tfvars.json
