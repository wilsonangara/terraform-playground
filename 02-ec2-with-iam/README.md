# 02-EC2-with-IAM

This example demonstrates how to create EC2 instance with and IAM Role attached to it using instance profile applying principle of the least privilege by granting only the minimal permissions required.

## Objectives

- Provision an EC2 instance with IAM Role attached with instance profile
- Observer terraform's graph dependency graph ordering between IAM and EC2 resources

## Observations

- Terraform is able to map the dependencies on which resource to be provisioned first before the other
- Terraform has a default parallelism behavior to provision multiple independent resources, in this case:
  - IAM policy and IAM role will be created in parallel
  - Once both are ready, IAM policy will be attached to the IAM policy while instance profile is being created
  - After the instance profile is created and IAM policy is attached to IAM role, IAM role will be attached to instance profile
  - Lastly, EC2 instance will be created with IAM role booted to it through instance profile
