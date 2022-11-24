#!/bin/bash
################################################################
#---INFRASTRUCTURE VARIABLES - DON'T EDIT
################################################################
echo 'TF_VAR_PROJECT="${{ github.event.repository.name }}-${{ github.ref_name }}"' >> $GITHUB_ENV
echo 'TF_VAR_BRANCH="${{ github.ref_name }}"' >> $GITHUB_ENV
echo 'AWS_ACCESS_KEY=$TF_VAR_AWS_ACCESS_KEY' >> $GITHUB_ENV
echo 'AWS_SECRET_KEY=$TF_VAR_AWS_SECRET_KEY' >> $GITHUB_ENV
echo 'TF_VAR_TYPE_COMPATIBILITY="EC2"' >> $GITHUB_ENV
echo 'TF_VAR_PUBLICIP="false"' >> $GITHUB_ENV
echo 'ECR_REPOSITORY="${{ github.event.repository.name }}-${{ github.ref_name }}"' >> $GITHUB_ENV
echo 'CONTAINER_NAME="${{ github.event.repository.name }}-${{ github.ref_name }}"' >> $GITHUB_ENV
echo 'ECS_SERVICE="${{ github.event.repository.name }}-${{ github.ref_name }}-service"' >> $GITHUB_ENV
echo 'ECS_TASK_DEFINITION="${{ github.event.repository.name }}-${{ github.ref_name }}"' >> $GITHUB_ENV