#!/bin/bash
  NAME=$( sed -n 1p 03_trigger/01_lambda_del )
  PROVIDER=$( sed -n 2p 03_trigger/01_lambda_del )
  SERVICE=$( sed -n 3p 03_trigger/01_lambda_del )
  # PROVIDER=$( sed -n 2p 01_infra/01_lambda/$NAME/values ) #### lambda

  d_pipeline="platf04/.github/workflows"
  pipeline="02_tmp/02_pipeline"
  # pipeline="02_tmp/02_pipeline/01_lambda"

  CLS=$( sed -n 1p 01_infra/$SER/$PRO/$NAM/values.yaml | awk '{print $2}' )
  if [ $CLS ]
  then
    sh 04_scripts/02_eks_del.sh
  fi
  
  echo $NAME > platf04/03_trigger/test
  cp $pipeline/$PROVIDER/main_delete.yaml .
  sed -i -e "s/PROVIDER/$PROVIDER/g" main_delete.yaml
  sed -i -e "s/SERVICE/$SERVICE/g" main_delete.yaml
  sed -e "s/NAME/$NAME/g" main_delete.yaml > $d_pipeline/main_delete.yaml

  # cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main_delete.yaml .
  # sed -i -e "s/NAME/$NAME/g" main_delete.yaml
  # cp main_delete.yaml platf04/.github/workflows/
