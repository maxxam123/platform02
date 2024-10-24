#!/bin/bash

  NAM=$( sed -n 1p 03_trigger/01_lambda )
  PRO=$( sed -n 2p 03_trigger/01_lambda )
  SER=$( sed -n 3p 03_trigger/01_lambda )

  AUT=$( sed -n 5p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  EFS=$( sed -n 6p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  SEC=$( sed -n 7p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  NGI=$( sed -n 8p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  CER=$( sed -n 9p 01_infra/10_eks/$PRO/$NAM/values.yaml | awk '{print $2}' )
  
  # ARN=$( sed -n 12p 01_infra/06_eks/$NAME/scripts/values.yaml | awk '{print $2}' )
  
  d_g="platf04/04_git"
  boo="02_tmp/03_git/01_bootstrap"
  mon="02_tmp/03_git/02_monitor"
  app="02_tmp/03_git/03_applicationset"

  echo $NAM
  mkdir -p $d_g/$PRO/$NAM

  # ############ BOOTSTRAP #####################
  
  # if [ $NGINX ]
  # then
  #   mkdir -p $d_g/$NAME/01_boo/01_nginx
    
  #   cp $boo/01_nginx/* $d_g/$NAME/01_bootstrap/01_nginx/
  # fi
  
  # if [ $CERTMANAGER ]
  # then
  #   mkdir -p $d_g/$NAME/01_boo/02_certmanager
  #   cp -r $boo/02_certmanager/* $d_g/$NAME/01_bootstrap/02_certmanager/
  # fi
  
  # if [ $ESO ]
  # then
  #   mkdir -p $d_g/$NAME/01_boo/03_eso
  #   cp -r $boo/03_eso/* $d_g/$NAME/01_bootstrap/03_eso/
  # fi
    
  # if [ $AUTOSCALER ]
  # then
  #   mkdir -p $d_g/$NAME/01_boo/04_autoscaler
  #   cp -r $bootstrap/04_autoscaler/* $d_g/$NAME/01_bootstrap/04_autoscaler/
  # fi

  # if [ $EFS ]
  # then
  #   mkdir -p $d_g/$NAME/01_bootstrap/05_efs_csi
  #   cp -r $bootstrap/05_efs_csi/kustomization.yaml $d_g/$NAME/01_bootstrap/05_efs_csi/kustomization.yaml
  #   sed -e "s/ARN/$ARN/g" $bootstrap/05_efs_csi/values.yaml > $d_g/$NAME/01_bootstrap/05_efs_csi/values.yaml
  # fi
  

  # ########### GITOPS #####################
  
  # if [ $PROMETHEUS ]
  # then
  #   mkdir -p $d_g/$NAME/02_monitor/01_prometheus
  #   cp -r $monitor/01_prometheus/* $d_g/$NAME/02_monitor/01_prometheus/
  # fi
    
  # if [ $GRAFANA ]
  # then
  #   mkdir -p $d_g/$NAME/02_monitor/02_grafana
  #   cp -r $monitor/02_grafana/* $d_g/$NAME/02_monitor/02_grafana/
  # fi

  # if [ $LOKI ]
  # then
  #   mkdir -p $d_g/$NAME/02_monitor/03_loki
  #   cp -r $monitor/03_loki/* $d_g/$NAME/02_monitor/03_loki/
  # fi

  # ############### ApplicationSet #############

  # mkdir -p $d_g/$NAME/03_applicationset/01_bootstrap
  # cp $applicationset/01_bootstrap/applicationset.yaml .
  # sed -e "s/NAME/$NAME/g" applicationset.yaml > $d_g/$NAME/03_applicationset/01_bootstrap/applicationset.yaml
  # rm -rf applicationset.yaml
  # # cp -r $applicationset/01_bootstrap/* $d_g/$NAME/03_applicationset/01_bootstrap/
  
  # mkdir -p $d_g/$NAME/03_applicationset/02_monitor
  # cp $applicationset/02_monitor/applicationset.yaml .
  # sed -e "s/NAME/$NAME/g" applicationset.yaml > $d_g/$NAME/03_applicationset/02_monitor/applicationset.yaml
  # # cp -r $applicationset/02_monitor/* $d_g/$NAME/02_applicationset/02_monitor/
