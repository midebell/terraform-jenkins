#!/bin/bash

cd /app/
/terraform init
/terraform plan \
  -auto-approve  \
  -input=false
