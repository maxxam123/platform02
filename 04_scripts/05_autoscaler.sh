#!/bin/bash

  git clone https://github.com/maxxam123/platf04.git
  
  NAME=$( sed -n 1p 03_trigger/05_autoscaler )
  PROVIDER=$( sed -n 2p 01_infra/05_autoscaler/$NAME/values )

  d_pipeline="platf04/.github/workflows"
  d_infra="platf04/01_infra/autoscaler"
  infra="01_infra/05_autoscaler"
  pipeline="02_tmp/02_pipeline/05_autoscaler"
  provider="02_tmp/01_terraform/01_providers"
  mkdir -p $d_pipeline
  mkdir -p $d_infra/$NAME
  
  sed -e "s/NAME/$NAME/g" $pipeline/$PROVIDER/main.yaml > $d_pipeline/$NAME.yaml
  sed -e "s/BUCKET/$NAME/g" $provider/$PROVIDER/02_provider.tf > $d_infra/$NAME/02_provider.tf
  
  cp $infra/$NAME/terraform.tfvars $d_infra/$NAME/terraform.tfvars
