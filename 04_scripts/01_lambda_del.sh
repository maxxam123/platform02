#!/bin/bash
  NAME=$( sed -n 1p 03_trigger/01_lambda_del )
  PROVIDER=$( sed -n 2p 01_infra/lambda/$NAME/values )

  d_pipeline="platf04/.github/workflows"
  pipeline="02_tmp/02_pipeline/01_lambda"
  
  echo $NAME > platf04/03_trigger/test
  
  # cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main_delete.yaml .
  # sed -i -e "s/NAME/$NAME/g" main_delete.yaml
  # cp main_delete.yaml platf04/.github/workflows/
  sed -e "s/NAME/$NAME/g" $pipeline/$PROVIDER/main_delete.yaml > $d_pipeline/
