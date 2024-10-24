#!/bin/bash
  NAME=$( sed -n 1p 03_trigger/01_lambda_del )
  PROVIDER=$( sed -n 2p 03_trigger/01_lambda_del )
  SERVICE=$( sed -n 3p 03_trigger/01_lambda_del )
  # PROVIDER=$( sed -n 2p 01_infra/01_lambda/$NAME/values ) #### lambda

  d_pipeline="platf04/.github/workflows"
  pipeline="02_tmp/02_pipeline"
  # pipeline="02_tmp/02_pipeline/01_lambda"

  CLS=$( sed -n 1p 01_infra/$SERVICE/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
  if [ $CLS ]
  then
    # sh 04_scripts/02_eks_del.sh
      touch platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script_del.sh
      
      AUT=$( sed -n 5p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
      EFS=$( sed -n 6p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
      SEC=$( sed -n 7p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
      
      if [ $AUT ]; then
        echo "cp ../../../../02_tmp/$SERVICE/$PROVIDER/08_autoscaler.tf ." >> platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script_del.sh
      fi
      
      if [ $EFS ]; then
        echo "cp ../../../../02_tmp/$SERVICE/$PROVIDER/09_efs.tf ." >> platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script_del.sh
      fi

      if [ $SEC ]; then
        echo "cp ../../../../02_tmp/$SERVICE/$PROVIDER/10_secdriver.tf ." >> platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script_del.sh
      fi
      
  fi

  # echo "cp ../../../../02_tmp/$SERVICE/$PROVIDER/01_variables.tf ." >> platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script.sh
  # echo "cp ../../../../02_tmp/$SERVICE/$PROVIDER/03_main.tf" . >> platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script.sh
  # echo "cp ../../../../03_pro/$PROVIDER/02_provider.tf" . >> platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script.sh
  
  echo $NAME > platf04/05_trig/trigger.yaml
  cp $pipeline/$PROVIDER/main_delete.yaml .
  sed -i -e "s/PROVIDER/$PROVIDER/g" main_delete.yaml
  sed -i -e "s/SERVICE/$SERVICE/g" main_delete.yaml
  sed -e "s/NAME/$NAME/g" main_delete.yaml > $d_pipeline/main_delete.yaml

  # touch platf04/01_infra/$SER/$PRO/$NAME/scripts/tests.sh

  # cp 02_tmp/02_pipeline/01_lambda/$PROVIDER/main_delete.yaml .
  # sed -i -e "s/NAME/$NAME/g" main_delete.yaml
  # cp main_delete.yaml platf04/.github/workflows/
