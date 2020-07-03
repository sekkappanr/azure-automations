#! /usr/bin/env sh

terraform workspace select dev_env || terraform workspace new dev_env
terraform init
    # -backend-config="bucket=$PROJECT_NAME-tf-state" \
    # -backend-config="prefix=terraform/state" \
    # -backend-config="credentials=../secret/service-account.json"