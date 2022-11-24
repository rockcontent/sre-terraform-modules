#!/bin/bash
################################################################
#---PROJECT VARIABLES
################################################################
echo 'TF_VAR_SUB_DOMAIN="domain.rockcontent.com"' >> $GITHUB_ENV
echo 'TF_VAR_APP_PORT="80"' >> $GITHUB_ENV
echo 'TF_VAR_CPU="128"' >> $GITHUB_ENV
echo 'TF_VAR_MEMORY="256"' >> $GITHUB_ENV
echo 'TF_VAR_METRIC_TYPE="ECSServiceAverageCPUUtilization"' >> $GITHUB_ENV
#echo 'TF_VAR_METRIC_TYPE="ECSServiceAverageMemoryUtilization"' >> $GITHUB_ENV
echo 'TF_VAR_MIN_CAPACITY="1"' >> $GITHUB_ENV
echo 'TF_VAR_MAX_CAPACITY="1"' >> $GITHUB_ENV
echo 'TF_VAR_TARGET_VALUE="80"' >> $GITHUB_ENV
echo 'TF_VAR_TG_INTERVAL="30"' >> $GITHUB_ENV
echo 'TF_VAR_TG_TIMEOUT="5"' >> $GITHUB_ENV
echo 'TF_VAR_TG_PATH="/"' >> $GITHUB_ENV
echo 'TF_VAR_TG_MATCHER="200"' >> $GITHUB_ENV
echo 'TF_VAR_TG_HEALTHY_THRESHOLD="5"' >> $GITHUB_ENV
echo 'TF_VAR_UNHEALTHY_THRESHOLD="2"' >> $GITHUB_ENV
echo 'TF_VAR_LOGSRETENTION="1"' >> $GITHUB_ENV
echo 'TF_VAR_ECRRETENTION="1"' >> $GITHUB_ENV