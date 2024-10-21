#!/bin/bash

  git clone https://github.com/maxxam123/platf04.git
  
  START=$( sed -n 1p 03_trigger/02_vpc )
  NAME=$( sed -n 1p 01_infra/vpc/$START/values )
  COUNT=$( sed -n 3p 01_infra/vpc/$START/values )
  PROVIDER=$( sed -n 2p 01_infra/vpc/$START/values )
  mkdir -p platf04/01_infra/vpc/$NAME
  
  cp 02_tmp/02_pipeline/02_vpc/$PROVIDER/main.yaml $NAME.yaml
  sed -i -e "s/NAME/$NAME/g" $NAME.yaml
  cp $NAME.yaml platf04/.github/workflows/
  
  cp 02_tmp/01_terraform/01_providers/$PROVIDER/02_provider.tf .
  sed -i -e "s/BUCKET/$NAME/g" 02_provider.tf
  
  cp 01_infra/vpc/$START/terraform.tfvars .
  
  cp terraform.tfvars platf04/01_infra/vpc/$NAME/terraform.tfvars
  cp 02_provider.tf platf04/01_infra/vpc/$NAME/02_provider.tf
