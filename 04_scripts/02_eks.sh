#!/bin/bash

  SERVICE=$( sed -n 3p 03_trigger/01_lambda )
  
  mkdir -p platf04/05_helm/$SERVICE
  cp -r 02_tmp/03_git/* platf04/05_helm/$SERVICE/
  
  NAME=$( sed -n 1p 03_trigger/01_lambda )
  PROVIDER=$( sed -n 2p 03_trigger/01_lambda )
  
  d_pipeline="platf04/.github/workflows"
  d_infra="platf04/01_infra/$SERVICE"
  d_helm="platf04/05_helm/$SERVICE"
  infra="01_infra/$SERVICE"
  pipeline="02_tmp/02_pipeline"
  provider="02_tmp/01_terraform/01_providers"
  
  mkdir -p $d_infra/$NAME
  mkdir -p $d_infra/$NAME/scripts
  
  cp $pipeline/$PROVIDER/main.yaml .
  sed -i -e "s/NAME/$NAME/g" main.yaml
  sed -i -e "s/PROVIDER/$PROVIDER/g" main.yaml
  sed -i -e "s/SERVICE/$SERVICE/g" main.yaml
  cp main.yaml $d_pipeline/$SERVICE-$NAME.yaml
  cat main.yaml
  
  sed -e "s/BUCKET/$NAME/g" $provider/$PROVIDER/02_provider.tf > $d_infra/$NAME/02_provider.tf
  
  cp -r $infra/$NAME/scripts/* $d_infra/$NAME/scripts/
  cp $infra/$NAME/* $d_infra/$NAME/
  cat $d_infra/$NAME/scripts/index.js
  cp $infra/$NAME/terraform.tfvars $d_infra/$NAME/terraform.tfvars
