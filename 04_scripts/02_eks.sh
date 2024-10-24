#!/bin/bash

  NAM=$( sed -n 1p 03_trigger/01_lambda )
  PRO=$( sed -n 2p 03_trigger/01_lambda )
  # SER=$( sed -n 3p 03_trigger/01_lambda )

  AUT=$( sed -n 5p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  EFS=$( sed -n 6p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  SEC=$( sed -n 7p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  NGI=$( sed -n 8p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  CER=$( sed -n 9p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )

  # # ARN=$( sed -n 12p 01_infra/06_eks/$NAME/scripts/values.yaml | awk '{print $2}' )
  if [ $AUT ]; then
    aut="cp ..\/..\/..\/..\/02_tmp\/SERVICE\/PROVIDER\/08_autoscaler.tf ."
    sed -i -e "s/AUTOSCALER/$aut/g" main.yaml
  fi

  if [ $EFS ]; then
    efs="cp ..\/..\/..\/..\/02_tmp\/SERVICE\/PROVIDER\/09_efs.tf ."
    sed -i -e "s/EFS/$efs/g" main.yaml
  fi

  if [ $SEC ]; then
    sec="cp ..\/..\/..\/..\/02_tmp\/SERVICE\/PROVIDER\/10_secdriver.tf ."
    sed -i -e "s/SECRETCSI/$sec/g" main.yaml
  fi

  cat main.yaml
  
  d_g="platf04/04_git"
  boo="02_tmp/03_git/01_bootstrap"
  mon="02_tmp/03_git/02_monitor"
  app="02_tmp/03_git/03_applicationset"

  mkdir -p $d_g/$PRO/$NAM

  # ############ BOOTSTRAP #####################
  
  if [ $NGI ]; then
    mkdir -p $d_g/$PRO/$NAM/01_bootstrap/01_nginx
    cp $boo/01_nginx/* $d_g/$PRO/$NAM/01_bootstrap/01_nginx/
  fi
  
  if [ $CER ]; then
    mkdir -p $d_g/$PRO/$NAM/01_bootstrap/02_certmanager
    cp -r $boo/02_certmanager/* $d_g/$PRO/$NAM/01_bootstrap/02_certmanager/
  fi


  # ########### GITOPS #####################
  
  # if [ $PRT ]
  # then
  #   mkdir -p $d_g/$PRO/$NAM/02_monitor/01_prometheus
  #   cp -r $monitor/01_prometheus/* $d_g/$PRO/$NAM/02_monitor/01_prometheus/
  # fi
    

  # ############### ApplicationSet #############

  # mkdir -p $d_g/$PRO/$NAM/03_apps/01_bootstrap
  # cp $app/01_bootstrap/applicationset.yaml .
  # sed -e "s/NAME/$NAM/g" applicationset.yaml > $d_g/$PRO/$NAM/03_apps/01_bootstrap/applicationset.yaml
  # rm -rf applicationset.yaml
  
  # mkdir -p $d_g/$PRO/$NAM/03_apps/02_monitor
  # cp $app/02_monitor/applicationset.yaml .
  # sed -e "s/NAME/$NAM/g" applicationset.yaml > $d_g/$PRO/$NAM/03_apps/02_monitor/applicationset.yaml
