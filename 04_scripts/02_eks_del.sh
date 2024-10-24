#!/bin/bash

  # NAM=$( sed -n 1p 03_trigger/01_lambda_del )
  # PRO=$( sed -n 2p 03_trigger/01_lambda_del )
  # SER=$( sed -n 3p 03_trigger/01_lambda_del )

  NAME=$( sed -n 1p 03_trigger/01_lambda_del )
  PROVIDER=$( sed -n 2p 03_trigger/01_lambda_del )
  PROVIDER=$( sed -n 3p 03_trigger/01_lambda_del )

  AUT=$( sed -n 5p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
  EFS=$( sed -n 6p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
  SEC=$( sed -n 7p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
  NGI=$( sed -n 8p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )
  CER=$( sed -n 9p 01_infra/10_eks/$PROVIDER/$NAME/values.yaml | awk '{print $2}' )

  # # ARN=$( sed -n 12p 01_infra/06_eks/$NAME/scripts/values.yaml | awk '{print $2}' )

  echo LS
  ls -la
  ls 
  touch platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts/script_del.sh
  ls platf04/01_infra/$SERVICE/$PROVIDER/$NAME/scripts
  # if [ $AUT ]; then
  #   echo "cp ../../../../02_tmp/$SER/$PRO/08_autoscaler.tf ." >> platf04/01_infra/$SER/$PRO/$NAM/scripts/script_del.sh
  # fi

  # if [ $EFS ]; then
  #   echo "cp ../../../../02_tmp/$SER/$PRO/09_efs.tf ." >> platf04/01_infra/$SER/$PRO/$NAM/scripts/script_del.sh
  # fi

  # if [ $SEC ]; then
  #   echo "cp ../../../../02_tmp/$SER/$PRO/10_secdriver.tf ." >> platf04/01_infra/$SER/$PRO/$NAM/scripts/script_del.sh
  # fi
