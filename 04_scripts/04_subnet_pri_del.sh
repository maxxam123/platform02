#!/bin/bash
  # SUBNET="04_subnet_pri_del"
  # NAME=$( sed -n 1p 03_trigger/$SUBNET )
  # PROVIDER=$( sed -n 2p 01_infra/$SUBNET/$NAME/values )

  # d_pipeline="platf04/.github/workflows"
  # pipeline="02_tmp/02_pipeline/$SUBNET"


  NAME=$( sed -n 1p 03_trigger/04_subnet_pri_del )
  PROVIDER=$( sed -n 2p 01_infra/04_subnet_pri_del/$NAME/values )

  d_pipeline="platf04/.github/workflows"
  pipeline="02_tmp/02_pipeline/04_subnet_pri_del"
  
  echo $NAME > platf04/03_trigger/test
  
  sed -e "s/NAME/$NAME/g" $pipeline/$PROVIDER/main_delete.yaml > $d_pipeline/main_delete.yaml

  # cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main_delete.yaml .
  # sed -i -e "s/NAME/$NAME/g" main_delete.yaml
  # cp main_delete.yaml platf04/.github/workflows/