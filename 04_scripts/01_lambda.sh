#!/bin/bash
  
  git clone https://github.com/maxxam123/platf04.git


  NAM=$( sed -n 1p 03_trigger/01_lambda )
  PRO=$( sed -n 2p 03_trigger/01_lambda )
  SER=$( sed -n 3p 03_trigger/01_lambda )
  
  d_p="platf04/.github/workflows"
  d_i="platf04/01_infra/$SER/$PRO"
  s_p="02_tmp/02_pipeline"
  s_i="01_infra/$SER/$PRO"
  
  mkdir -p $d_i/$NAM/scripts
  
  cp -r $s_i/$NAM/scripts/* $d_i/$NAM/scripts/
  cp $s_i/$NAM/terraform.tfvars $d_i/$NAM/terraform.tfvars
  
  cp $s_p/$PRO/main.yaml .
  CLS=$( sed -n 1p 01_infra/$SER/$PRO/$NAM/values.yaml | awk '{print $2}' )
  # CLS=$( sed -n 4p 03_trigger/01_lambda | awk '{print $2}' )
  if [ $CLS ]
  then
    sh 04_scripts/02_eks.sh
  fi

  sed -i -e "s/NAME/$NAM/g" main.yaml
  sed -i -e "s/PROVIDER/$PRO/g" main.yaml
  sed -i -e "s/SERVICE/$SER/g" main.yaml
  cp main.yaml $d_p/$SER-$PRO-$NAM.yaml

  cat main.yaml

  

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
