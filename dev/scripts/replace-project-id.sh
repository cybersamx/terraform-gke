#!/usr/bin/env bash

declare -r FIND_STR="<PROJECT_ID>"

cd ..
sed -i '' s/${FIND_STR}/${PROJECT_ID}/g terraform.tfvars
sed -i '' s/${FIND_STR}/${PROJECT_ID}/g backend.tf
