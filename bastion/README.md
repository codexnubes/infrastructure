# Overview

Scripts that create a bastion host to gain access to servers (Jump Box).  Recommendation is to put it in a management VPC with peering/access to the other domains.

## vpc-ssh-bastion.yaml
basic bastion host in HA configuration behind an autoscaling group using an EIP
nothing overly special here, just using an EIP and in users-data attaching the EIP to the instance.  Autoscaling for HA, not for scalability.

## bastion-iam-based-ssh-access.yaml
a little more special.  based on the work here: 
https://cloudonaut.io/manage-aws-ec2-ssh-access-with-iam/ 
also view https://github.com/widdix/aws-ec2-ssh for more information including setup for multi-account strategy
Allows for uploading ssh keys to IAM users.  They can have no access to AWS resources, just as a repository for storing credentials
Remove them from IAM and access to the bastion goes away based on the cron job on the host. 

## bastion-iam-access-recording
a little more special still.  takes the IAM ssh access bastion template and adds bastion activity logging based on the work presented here: https://aws.amazon.com/blogs/security/how-to-record-ssh-sessions-established-through-a-bastion-host/
This creates a couple of s3 buckets, records all the activity on the bastion, and move those logs every 5 minutes to s3.  A few tweaks to get everything working here.  Did not want to follow the how-to-record example directly.  It uses an S3 bucket to upload valid keys.  That feels less secure then using IAM, although the same result is pretty much achieved.  

### NEXT STEPS
I'm breaking out some of the config sets scripts to be independent that way I can setup a curl http://github.somewhere/somescript |sh to execute and keep the Cf small and ability to update the script without building change sets and re-deploy.  Just update the script, check it in, and terminate a server.  When the new one comes up it will pull the updated script.
Adding AV & monitoring configurations to the base image 

### RECOMMENDATIONS
Clone the Amazon Linux AMI, then encrypt it using KMS and boot to an encrypted boot volume. 
