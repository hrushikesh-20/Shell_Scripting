#!/bin/bash

# This Script will report the AWS resource usage

# AWS S3, EC2, Lambda, IAM Users

# List The S3 buckets
echo "Print list of S3 bucket"
aws s3 ls

# List EC2 Instances
echo "Print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceID'

# List Lambda
echo "Print list of Lambda functions"
aws lambda list-functions

# List IAM users
echo "Print list of IAM users"
aws iam list-users
