#!/usr/bin/env bash

# Execute Cloudformation to build out a vpc using the ../vpc.yaml tempalte

stack-name=$1 #stack-name
tempalte-body=$2 #s3 bucket same of where to find the tempalte-body
parameters=$3 #s3 bucket location of the parameters file
region=$4 #region in which to deploy the template

# usage
# ./vpc_setup.sh stack-name template-body parameters region

IFS=$'\n'

date >> logs/vpc_setup.log

aws cloudformation create-stack --stack-name $1 --template-body $2 --parameters $3 --region $4 --disable-rollback
