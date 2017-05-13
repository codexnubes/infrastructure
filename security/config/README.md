# Overview

## config-recorder.yaml

Configurers AWS Configuration Recorder to take a account snapshot every 24 hours

### Parameters:

ConfigBucket: s3 bucket to store configuration
The bucket must exist.  It is recommended to use the CloudTrail bucket setup by the logging.yaml cloudformation script
This will create a folder structure

my-bucket/AWSLogs/my-account-number/CloudTrail &
my-bucket/AWSLgos/my-account-number/Config

For multi-account setup the CloudTrail and Config bucket should be in a centralized account and that central account will need to give permission for the child account to write to the s3 bucket

## config-rules.yaml

Setups up a number of AWS Configuration Rules for use in auditing
THIS ONE WILL COST YOU $$ ~ $35 / mo
Config rules cost $2/mo each and this setups up several

### Parameters:

Profile Level: Level 1 or Level 2 (more restrictive controls)
NotificationEmail: email address where notifications should go

### NOTES:

This is fairly un-altered from the Security Baseline Quickstart.  

TODO :: update for specific requirements
TODO :: build seperate Lambda functions for auto remidiation 