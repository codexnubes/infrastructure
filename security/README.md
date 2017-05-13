# Overview

We secure our AWS enviornments following best practices generally following the principles outlined in the NIST 800-53 Standardized Architecture on AWS Cloud
 
 https://aws.amazon.com/about-aws/whats-new/2016/01/nist-800-53-standardized-architecture-on-the-aws-cloud-quick-start-reference-deployment/
 
## Usage

We don't leverage nested stacks as in the Quickstart, instead we break the stacks into individual permamertized Cloudformations which can be deployed seperately through a pipeline. 

### I. Cloudtrail
Run cloudtrail/logging.yml
 
### II. Config
Run config/config-recorder.yaml
Run config-rules.yaml

### III. IAM
Run iam/passwrod-policy.yaml
Run iam/iam-users.yaml

### Next Steps

Once these steps are complete you can start to build out Infrastructure to host services.  Next logical step is to configure the VPC[s] for the account.




