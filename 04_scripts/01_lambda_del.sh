#!/bin/bash
  NAME=$( sed -n 1p 03_trigger/01_lambda_del )
  PROVIDER=$( sed -n 2p 01_infra/lambda/$NAME/values )
  echo NAME
  echo $NAME
  
  echo $NAME > platf04/03_trigger/test
  
  mkdir -p platf04/.github/workflows
  # cp 02_tmp/02_pipeline/01_lambda/main_delete.yaml .
  cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main_delete.yaml .
  sed -i -e "s/NAME/$NAME/g" main_delete.yaml
  cp main_delete.yaml platf04/.github/workflows/
