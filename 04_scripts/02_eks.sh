#!/bin/bash

  NAME=$( sed -n 1p 03_trigger/01_lambda )
  SERVICE=$( sed -n 3p 03_trigger/01_lambda )
  
  NGINX=$( sed -n 5p 03_trigger/01_lambda | awk '{print $2}' )
  CERTMANAGER=$( sed -n 6p 03_trigger/01_lambda | awk '{print $2}' )
  ESO=$( sed -n 7p 03_trigger/01_lambda | awk '{print $2}' )
  PROMETHEUS=$( sed -n 8p 03_trigger/01_lambda | awk '{print $2}' )
  GRAFANA=$( sed -n 9p 03_trigger/01_lambda | awk '{print $2}' )
  LOKI=$( sed -n 10p 03_trigger/01_lambda | awk '{print $2}' )
  
  d_helm="platf04/05_helm"
  bootstrap="02_tmp/03_git/01_bootstrap"
  monitor="02_tmp/03_git/02_monitor"
  applicationset="02_tmp/03_git/03_applicationset"

  echo $NAME
  mkdir -p $d_helm/$NAME

  ############ BOOTSTRAP #####################
  
  if [ $NGINX ]
  then
    mkdir -p $d_helm/$NAME/01_bootstrap/01_nginx
    
    cp $bootstrap/01_nginx/* $d_helm/$NAME/01_bootstrap/01_nginx/
  fi
  
  if [ $CERTMANAGER ]
  then
    mkdir -p $d_helm/$NAME/01_bootstrap/02_certmanager
    cp -r $bootstrap/02_certmanager/* $d_helm/$NAME/01_bootstrap/02_certmanager/
  fi
  
  if [ $ESO ]
  then
    mkdir -p $d_helm/$NAME/01_bootstrap/03_eso
    cp -r $bootstrap/03_eso/* $d_helm/$NAME/01_bootstrap/03_eso/
  fi

  ########### GITOPS #####################
  
  if [ $PROMETHEUS ]
  then
    mkdir -p $d_helm/$NAME/02_monitor/01_prometheus
    cp -r $monitor/01_prometheus/* $d_helm/$NAME/02_monitor/01_prometheus/
  fi
    
  if [ $GRAFANA ]
  then
    mkdir -p $d_helm/$NAME/02_monitor/02_grafana
    cp -r $monitor/02_grafana/* $d_helm/$NAME/02_monitor/02_grafana/
  fi

  if [ $LOKI ]
  then
    mkdir -p $d_helm/$NAME/02_monitor/03_loki
    cp -r $monitor/03_loki/* $d_helm/$NAME/02_monitor/03_loki/
  fi

  ############### ApplicationSet #############

    mkdir -p $d_helm/$NAME/03_applicationset/01_bootstrap
    cp $applicationset/01_bootstrap/applicationset.yaml .
    sed -e "s/NAME/$NAME/g" applicationset.yaml > $d_helm/$NAME/03_applicationset/01_bootstrap/applicationset.yaml
    rm -rf applicationset.yaml
    # cp -r $applicationset/01_bootstrap/* $d_helm/$NAME/03_applicationset/01_bootstrap/
    
    mkdir -p $d_helm/$NAME/03_applicationset/02_monitor
    cp $applicationset/02_monitor/applicationset.yaml .
    sed -e "s/NAME/$NAME/g" applicationset.yaml > $d_helm/$NAME/03_applicationset/02_monitor/applicationset.yaml
    # cp -r $applicationset/02_monitor/* $d_helm/$NAME/02_applicationset/02_monitor/
  
  # NAME=$( sed -n 1p 03_trigger/01_lambda )
  # PROVIDER=$( sed -n 2p 03_trigger/01_lambda )
  
  # d_pipeline="platf04/.github/workflows"
  # d_infra="platf04/01_infra/$SERVICE"
  # d_helm="platf04/05_helm/$SERVICE"
  # infra="01_infra/$SERVICE"
  # pipeline="02_tmp/02_pipeline"
  # provider="02_tmp/01_terraform/01_providers"
  
  # mkdir -p $d_infra/$NAME
  # mkdir -p $d_infra/$NAME/scripts
  
  # cp $pipeline/$PROVIDER/main.yaml .
  # sed -i -e "s/NAME/$NAME/g" main.yaml
  # sed -i -e "s/PROVIDER/$PROVIDER/g" main.yaml
  # sed -i -e "s/SERVICE/$SERVICE/g" main.yaml
  # cp main.yaml $d_pipeline/$SERVICE-$NAME.yaml
  # cat main.yaml
  
  # sed -e "s/BUCKET/$NAME/g" $provider/$PROVIDER/02_provider.tf > $d_infra/$NAME/02_provider.tf
  
  # cp -r $infra/$NAME/scripts/* $d_infra/$NAME/scripts/
  # cp $infra/$NAME/* $d_infra/$NAME/
  # cat $d_infra/$NAME/scripts/index.js
  # cp $infra/$NAME/terraform.tfvars $d_infra/$NAME/terraform.tfvars
