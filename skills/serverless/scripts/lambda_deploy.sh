#!/bin/bash
# AWS Lambda Deployment Script
FUNCTION_NAME=${1:-my-function}
ZIP_FILE=${2:-function.zip}

zip -r "$ZIP_FILE" . -x "*.git*"
aws lambda update-function-code \
    --function-name "$FUNCTION_NAME" \
    --zip-file "fileb://$ZIP_FILE"
