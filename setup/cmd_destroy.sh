#!/bin/bash

# terraform destroy -var credentials=<credential_file_here> -var-file=testing.tfvars.json
terraform destroy -var-file=testing.tfvars.json
