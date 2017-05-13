# Overview

This is the Ultimate VPC template.  
- It will create from 1 to 16 subnets in 1 to 4 AZs in any region.
- It will peer to another vpc (management following the NIST quickstart)
- It will setup VPC FlowLogs to log all traffic for any number of days

Subnets are setup as 
- Public (assossiated with a route table with 0.0.0.0/0 to an internet gateway)
- Private (no 0.0.0.0/0 after this template, requires Nat-gateway for outbound and access via a bastion host)
- Restricted (intended for RDS, EFS, and those services which should not touch internet !period!)

TODO:: for pipeline leverage infoblox and/or another IPAM to get and pass parameters into the template


