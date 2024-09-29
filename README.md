# Ideariver.terraform

Welcome to **Ideariver.terraform**, an open-source project showcasing the complete Terraform infrastructure for the **Ideariver** application. This repository serves as an example of how to manage infrastructure as code (IaC) using Terraform, with a focus on best practices, security, scalability, and modularity. The aim of this project is to demonstrate my infrastructure management skills to potential employers and collaborators.

[![Watch the video](https://img.youtube.com/vi/7lbS1U30gGs/maxresdefault.jpg)](https://youtu.be/7lbS1U30gGs)
## [Watch the video](https://youtu.be/7lbS1U30gGs)

## Overview

The **ideariver.terraform** project encapsulates all Terraform configurations needed to deploy and manage the infrastructure for **Ideariver**. This includes:

- **AWS EC2 Instances**: To run the application.
- **AWS ECR (Elastic Container Registry)**: To store Docker images.
- **AWS Route53**: For domain management.
- **AWS SES (Simple Email Service)**: For sending emails.
- **AWS IAM**: Role-based access control for services.
- **AWS EBS (Elastic Block Store)**: Persistent storage for databases and services.
- **AWS Security Groups**: Configuring network access and security rules.

This project demonstrates the following:

- Use of Terraform to create and manage cloud infrastructure.
- Integration with AWS services.
- Modular and reusable Terraform components.
- Security best practices, such as least-privilege access policies.
- Automated deployment through infrastructure as code (IaC).

## Project Structure

```bash
ideariver.terraform/
│
├── modules/                        # Reusable Terraform modules
│   ├── ec2/                        # EC2 instance provisioning module
│   ├── ecr/                        # ECR (Elastic Container Registry) module
│   ├── iam_role/                   # IAM role and policy management
│   ├── security_group/             # Security group configuration
│   ├── ebs_volumes/                # EBS volume provisioning
│   ├── elastic_ip/                 # Elastic IP provisioning
│   ├── route53/                    # Route53 DNS management
│   └── ses/                        # SES for email services
│
├── terraform.config.json           # Centralized configuration for environment-specific variables
├── main.tf                         # Main Terraform configuration file
├── variables.tf                    # Terraform variables definitions
├── outputs.tf                      # Output values of the Terraform resources
├── .gitignore                      # Git ignore file to protect sensitive files
└── README.md                       # Project readme file (this file)
```

## Requirements

To use this project, you will need the following:

- Terraform: v0.12 or newer.
- AWS CLI: Configured with the necessary permissions for your AWS account.
- AWS Account: Access to AWS to provision infrastructure.

Make sure you have the appropriate permissions to deploy resources like EC2, ECR, IAM roles, Route53, and SES.

## Usage

**_*Clone the Repository*_**

```bash

git clone https://github.com/nima70/ideariver.terraform.git
cd ideariver.terraform
```

**_*Configure AWS Credentials*_**

Make sure your AWS CLI is configured. You can set up your credentials using the following command:

```bash
aws configure
```

**_Set Up Environment Variables_**

Modify the terraform.config.json file to define your environment-specific variables. For example, AWS region, instance types, EBS sizes, and domain names.

**_Initialize Terraform_**

Run the following command to initialize Terraform and download the necessary providers:

```bash
terraform init
Apply the Configuration
```

Apply the Terraform configuration to deploy the infrastructure. You will be prompted to confirm before Terraform makes any changes to your AWS account:

```bash
terraform apply
```

**_Tear Down the Infrastructure_**

If you want to remove all infrastructure created by Terraform, run:

```bash
terraform destroy
```

## Modules

The infrastructure is broken down into reusable Terraform modules to enhance modularity and scalability. Here's a brief overview of the available modules:

- EC2 Module: Provision AWS EC2 instances for your application.
- ECR Module: Manage Docker container registries with AWS ECR.
- IAM Role Module: Define IAM roles and attach necessary policies.
- Security Group Module: Configure security groups to control network access.
- EBS Volumes Module: Provision and manage Elastic Block Store volumes.
- Elastic IP Module: Assign Elastic IPs to EC2 instances.
- Route53 Module: Manage DNS records and integrate with AWS Route53.
- SES Module: Configure AWS Simple Email Service (SES) for sending emails.

**_Environment Variables_**

The project leverages a terraform.config.json file for managing environment-specific variables, such as:

- AWS Region
- AMI ID
- EC2 Instance types
- ECR repositories
- Security group rules
- Route53 Zone IDs
- Email domains for SES

This approach allows centralization of configurations, making it easier to modify, update, and manage environments without hardcoding sensitive or environment-specific data.

### Security Considerations

- IAM Roles: Follow the principle of least privilege to ensure that EC2 instances and other AWS resources have only the permissions they need.
- Secrets Management: Any sensitive information, such as access keys or tokens, should be managed through environment variables or AWS Secrets Manager.
- Network Security: Security groups are configured to restrict access to EC2 instances. Only necessary ports (e.g., SSH, HTTP, HTTPS) are open to specific IP ranges.

### License

This project is licensed under the MIT License. See the LICENSE file for details.
