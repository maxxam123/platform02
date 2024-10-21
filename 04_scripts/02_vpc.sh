#!/bin/bash

  git clone https://github.com/maxxam123/platf04.git
  
  NAME=$( sed -n 1p 03_trigger/02_vpc )
  PROVIDER=$( sed -n 2p 01_infra/02_vpc/$NAME/values ) #### vpc

  d_pipeline="platf04/.github/workflows"
  d_infra="platf04/01_infra/vpc"
  infra="01_infra/02_vpc"  #### vpc
  pipeline="02_tmp/02_pipeline/02_vpc"
  provider="02_tmp/01_terraform/01_providers"
  
  mkdir -p $d_infra/$NAME
  
  sed -e "s/NAME/$NAME/g" $pipeline/$PROVIDER/main.yaml > $d_pipeline/$NAME.yaml
  sed -e "s/BUCKET/$NAME/g" $provider/$PROVIDER/02_provider.tf > $d_infra/$NAME/02_provider.tf
  
  cp $infra/$NAME/terraform.tfvars $d_infra/$NAME/terraform.tfvars

  # mkdir -p platf04/01_infra/vpc/$NAME
  # cp 02_tmp/02_pipeline/02_vpc/$PROVIDER/main.yaml $NAME.yaml
  # sed -i -e "s/NAME/$NAME/g" $NAME.yaml
  # cp $NAME.yaml platf04/.github/workflows/
  # sed -e "s/NAME/$NAME/g" 02_tmp/02_pipeline/02_vpc/$PROVIDER/main.yaml > platf04/.github/workflows/$NAME.yaml
  # cp 02_tmp/01_terraform/01_providers/$PROVIDER/02_provider.tf .
  # sed -i -e "s/BUCKET/$NAME/g" 02_provider.tf
  # cp 02_provider.tf platf04/01_infra/vpc/$NAME/02_provider.tf
  # sed -e "s/BUCKET/$NAME/g" 02_tmp/01_terraform/01_providers/$PROVIDER/02_provider.tf > platf04/01_infra/vpc/$NAME/02_provider.tf
  # cp 01_infra/vpc/$START/terraform.tfvars .
  # cp terraform.tfvars platf04/01_infra/vpc/$NAME/terraform.tfvars
  # cp 01_infra/vpc/$NAME/terraform.tfvars platf04/01_infra/vpc/$NAME/terraform.tfvars
