#!/bin/bash

  NAME=$( sed -n 1p 03_trigger/02_vpc_del )
  PROVIDER=$( sed -n 2p 01_infra/vpc/$NAME/values )

  d_pipeline="platf04/.github/workflows"
  pipeline="02_tmp/02_pipeline/02_vpc"
  
  echo $NAME > platf04/03_trigger/test
  
  sed -e "s/NAME/$NAME/g" $pipeline/$PROVIDER/main_delete.yaml > $d_pipeline/main_delete.yaml

  # cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main_delete.yaml .
  # sed -i -e "s/NAME/$NAME/g" main_delete.yaml
  # cp main_delete.yaml platf04/.github/workflows/
