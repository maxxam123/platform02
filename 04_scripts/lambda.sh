#!/bin/bash
  
  git clone https://github.com/maxxam123/platf04.git
  
  START=$( sed -n 1p 03_trigger/01_lambda )
  NAME=$( sed -n 1p 01_infra/lambda/$START/values )
  PROVIDER=$( sed -n 2p 01_infra/lambda/$START/values )
  
  cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main.yaml $NAME.yaml
  sed -i -e "s/NAME/$NAME/g" $NAME.yaml
  cp $NAME.yaml platf04/.github/workflows/
  
  mkdir -p platf04/01_infra/lambda/$NAME
  
  cp 01_infra/lambda/$START/index.js .
  cp index.js platf04/01_infra/lambda/$NAME/index.js
  
  
  cp 02_tmp/01_terraform/01_providers/$PROVIDER/02_provider.tf .
  
  sed -i -e "s/BUCKET/$NAME/g" 02_provider.tf
  
  cp 01_infra/lambda/$START/terraform.tfvars .
  cp terraform.tfvars platf04/01_infra/lambda/$NAME/terraform.tfvars
  cp 02_provider.tf platf04/01_infra/lambda/$NAME/02_provider.tf
