#!/bin/bash
################################################################
#---PRODUCT VARIABLES
##---ION-DEV-PUBLIC
################################################################
echo 'TF_VAR_TAG_TRIBE="P&E"'>> $GITHUB_ENV
echo 'TF_VAR_TAG_ENVIRONMENT="dev"'>> $GITHUB_ENV
echo 'TF_VAR_PRODUCT="ION"'>> $GITHUB_ENV
echo 'TFBUCKETSTATE="ion-dev-tfstate"'>> $GITHUB_ENV
echo 'TF_VAR_AWS_ACCESS_KEY=${{ secrets.ION_DEV_AWS_ACCESS_KEY }}'>> $GITHUB_ENV
echo 'TF_VAR_AWS_SECRET_KEY=${{ secrets.ION_DEV_AWS_SECRET_KEY }}'>> $GITHUB_ENV
echo 'AWS_ACCESS_KEY=$TF_VAR_AWS_ACCESS_KEY'>> $GITHUB_ENV
echo 'AWS_SECRET_KEY=$TF_VAR_AWS_SECRET_KEY'>> $GITHUB_ENV
echo 'AWS_REGION=us-east-1'>> $GITHUB_ENV
echo 'TF_VAR_AWS_REGION=$AWS_REGION'>> $GITHUB_ENV
echo 'TF_VAR_AWS_ACCOUNT_ID=848484848'>> $GITHUB_ENV
echo 'TF_VAR_CLUSTER_NAME="rockcluster"'>> $GITHUB_ENV
echo 'TF_VAR_LOADBALANCER="arn:aws:elasticloadbalancing:us-east-1:%%%%:listener/app/rockcontent/58b5f4a2d910e523/13b0d7a4e30c8213"'>> $GITHUB_ENV
echo 'TF_VAR_SECURITYGROUP="sg-000fb37a383156408"'>> $GITHUB_ENV
echo 'TF_VAR_SUBNET1="subnet-019dc8320867c60e3"'>> $GITHUB_ENV
echo 'TF_VAR_SUBNET2="subnet-07065a42174b5cac4"'>> $GITHUB_ENV
echo 'TF_VAR_VPC="vpc-016c1ba07db7fe784"'>> $GITHUB_ENV