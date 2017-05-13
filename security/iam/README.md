# Overview

Creates some base level IAM groups and roles & sets the password policy

## password-policy

Straight forward template which sets the iam password policy for users.

### NOTES

For corporate and/or enterprise deployments it is recommended to set a SUPER complex password policy here. Use local IAM users rarely and instead setup ADFS, SAML, OAUTH, SSO leveraging Okta or another tool of choice and leveraging a corporate directly to provide access via assumed roles.

## iam-users

Taken from Security Benchmark and fairly un-altered to create a few groups/roles for use in IAM

