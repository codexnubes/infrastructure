#!/usr/bin/env bash
IFS=$'\n'

declare -a region="$(aws ec2 describe-regions --output text|awsk '{print $3}')"

# run config recorder stack build in every region
