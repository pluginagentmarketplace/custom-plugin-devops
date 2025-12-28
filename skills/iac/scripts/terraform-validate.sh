#!/bin/bash
echo "Validating Terraform..."
terraform init -backend=false
terraform validate
terraform fmt -check
echo "Validation complete!"
