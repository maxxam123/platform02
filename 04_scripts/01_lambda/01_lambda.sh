#!/bin/bash
  
  git clone https://github.com/maxxam123/platf04.git

  NAME=$( sed -n 1p 03_trigger/01_lambda )
  PROVIDER=$( sed -n 2p 01_infra/01_lambda/$NAME/values )
  # PROVIDER=$( sed -n 2p 03_trigger/01_lambda )
  # SERVICE=$( sed -n 3p 03_trigger/01_lambda )
  
  d_pipeline="platf04/.github/workflows"
  d_infra="platf04/01_infra/01_lambda"
  infra="01_infra/01_lambda"
  pipeline="02_tmp/02_pipeline/01_lambda"
  # pipeline="02_tmp/02_pipeline"
  provider="02_tmp/01_terraform/01_providers"
  
  mkdir -p $d_infra/$NAME
  # mkdir -p $d_infra/$NAME/scripts
  
  sed -e "s/NAME/$NAME/g" $pipeline/$PROVIDER/main.yaml > $d_pipeline/01_$NAME.yaml
  # cp $pipeline/$PROVIDER/main.yaml > .
  # sed -i -e "s/NAME/$NAME/g" main.yaml
  # sed -i -e "s/PROVIDER/$PROVIDER/g" main.yaml
  # sed -i -e "s/SERVIDE/$SERVIDE/g" main.yaml
  # cp main.yaml $d_pipeline/$SERVICE_$NAME.yaml
  # cat main.yaml
  
  sed -e "s/BUCKET/$NAME/g" $provider/$PROVIDER/02_provider.tf > $d_infra/$NAME/02_provider.tf
  
  cp $infra/$NAME/index.js $d_infra/$NAME/index.js
  # cp $infra/$NAME/scripts/* $d_infra/$NAME/scripts/

  cp $infra/$NAME/terraform.tfvars $d_infra/$NAME/terraform.tfvars

  

  # cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main.yaml $NAME.yaml
  # sed -i -e "s/NAME/$NAME/g" $NAME.yaml
  # cp $NAME.yaml platf04/.github/workflows/

  # sed -e "s/NAME/$NAME/g" 02_tmp/02_pipeline/01_lambda/$PROVIDER/main.yaml > platf04/.github/workflows/main.yaml
  # mkdir -p platf04/01_infra/lambda/$NAME
  # cp 01_infra/lambda/$NAME/index.js platf04/01_infra/lambda/$NAME/index.js
  # cp index.js platf04/01_infra/lambda/$NAME/index.js
  
  
  # cp 02_tmp/01_terraform/01_providers/$PROVIDER/02_provider.tf .
  # sed -i -e "s/BUCKET/$NAME/g" 02_provider.tf
  # cp 02_provider.tf platf04/01_infra/lambda/$NAME/02_provider.tf
  
  # sed -e "s/BUCKET/$NAME/g" 02_tmp/01_terraform/01_providers/$PROVIDER/02_provider.tf > platf04/01_infra/lambda/$NAME/02_provider.tf
  # cp 01_infra/lambda/$START/terraform.tfvars .
  # cp terraform.tfvars platf04/01_infra/lambda/$NAME/terraform.tfvars
  # cp 01_infra/lambda/$NAME/terraform.tfvars platf04/01_infra/lambda/$NAME/terraform.tfvars
