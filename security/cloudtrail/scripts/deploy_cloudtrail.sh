#!/usr/bin/env bash

# usage ./depoly_cloudtrail.sh myprofile cf-name bucket-name email@address.here
# this will pass parameters into the script which are used to build out the Cloudformation Template
# update - need to migrate parameters to a parameter file
# update - migrate - move the template and parameters file to s3
# update - toggle to allow for create-stack and update-stack options
# update - build out stack change set
# build out a stack policy template

profile=$1 #aws profile in the .aws/credentials file
name=$2 #name of Cloudformation to run | must be unique within the account/region
bucket=$3 #s3 bucket where the logs will go
email=$4 #notification email for security events

IFS=$'\n'

date >> logs/deploy_cloudtrail.log
wget https://raw.githubusercontent.com/neildmorris/infrastructure/master/security/cloudtrail/logging-cross-account.yml

# Get all the Regions
declare -a regions=($(aws ec2 describe-regions --profile $1 --region us-east-1 --output text|awk '{print $3}'))

for region in ${regions[@]}
do
    # Deploy CloudTrail in each Region
    if [[ $(aws cloudtrail describe-trails --region $region --output text --profile $1) == "" ]]; then
      echo "no trail in $region"
      aws cloudformation create-stack --stack-name $2 --template-body file:///logging-cross-account.yml --parameters ParameterKey=NotifyEmail,ParameterValue=$5,ParameterKey=CloudTrailBucket,ParameterValue=$4 --disable-rollback --profile $1 2>&1 |tee -a logs/deploy_cloudtrail.log &
    else
      echo "trail exist in $region" >> logs/deploy_cloudtrail.log
    fi

done

rm logging-cross-account.yaml -rf


