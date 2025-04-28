# 01-simple-s3-bucket

This example demonstrates how to create and manage an AWS S3 bucket using Terraform. It’s configured to work seamlessly against LocalStack for local testing, but can be pointed at real AWS by adjusting the provider settings.

## Folder structure

```
├── main.tf       # Provider
├── s3.tf         # S3 resources
├── variables.tf  # Input variables
├── outputs.tf    # Exported values
└── README.md     # Overview and instructions
```

## Prerequisites

- Terraform v1.5.0 or later
- Docker & LocalStack (if testing locally)

## Usage

1. Start localstack

```
$ docker run -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack
```

2. Initialize Terraform

```
$ terraform init
```

3. Plan changes

```
$ terraform plan -out=plan.tfplan
```

4. Apply changes

```
$ terraform apply plan.tfplan
```

5. Verify bucket

```
$ aws --endpoint-url=http://localhost:4566 s3 ls
```

6. Destroy bucket

```
$ terraform destroy
```

## Configuration & Variables

| Variable    | Default            | Description           |
| ----------- | ------------------ | --------------------- |
| aws_region  | ap-southeast-3     | AWS region to target  |
| bucket_name | tf-localstack-demo | Name of the S3 bucket |

## Outputs

| Output        | Description                         |
| ------------- | ----------------------------------- |
| bucket_name   | The name of the created S3 bucket   |
| bucket_arn    | The ARN of the S3 bucket            |
| bucket_domain | Regional domain (e.g. for websites) |

## Customization

- Switch to real AWS: Remove or adjust the endpoints block in provider "aws" and supply real AWS credentials instead of dummy values.
- Path-style URLs: s3_use_path_style is required for LocalStack; you can remove it for AWS.

## Cleanup

Ensure you run `terraform destroy` to remove the bucket and avoid orphaned resources.
