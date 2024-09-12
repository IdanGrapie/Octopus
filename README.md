
# Terraform EKS

This project automates the deployment of an AWS EKS (Elastic Kubernetes Service) cluster using Terraform. The setup includes provisioning the required AWS infrastructure, configuring the Kubernetes cluster, and deploying applications with Helm.

## Features

- **EKS Cluster**: Automated provisioning of an EKS cluster.
- **Terraform**: Infrastructure as code (IaC) using Terraform.
- **Helm**: Helm charts for application deployment.
- **Kubernetes**: Manage and scale containerized applications.
- **CI/CD Integration**: in progress

## Prerequisites

- Terraform v1.x.x
- AWS CLI configured with the necessary access
- kubectl v1.x.x
- Helm v3.x.x

## Infrastructure Overview

- **VPC**: A Virtual Private Cloud with public and private subnets.
- **EKS**: AWS EKS cluster.
- **Node Groups**: EC2 instances for worker nodes.
- **Security**: Managed via AWS security groups and IAM roles.
  
## Setup Instructions

### 1. Clone the repository

\`\`\`bash
git clone https://github.com/IdanGrapie/Terraform_EKS.git
cd Terraform_EKS
\`\`\`

### 2. Configure AWS Credentials

Ensure your AWS credentials are properly configured for Terraform to interact with AWS.

\`\`\`bash
aws configure
\`\`\`

### 3. Initialize and apply Terraform

\`\`\`bash
terraform init
terraform apply
\`\`\`

This will provision the necessary AWS resources for EKS.

### 4. Access the EKS Cluster

Once the infrastructure is provisioned, update your kubeconfig to access the EKS cluster:

\`\`\`bash
kubectl get services --namespace default
\`\`\`
COPY the ELB address and try accessing it, if you see the site everything works  


## File Structure

\`\`\`
├── helm/                 # Helm charts for deploying applications
├── main.tf               # Main Terraform configuration file
├── variables.tf          # Terraform variables
├── outputs.tf            # Terraform outputs
└── README.md             # Project documentation (this file)
\`\`\`

## Notes

- Ensure that your AWS user/role has the necessary permissions to create EKS clusters and associated resources.
- Adjust configurations in `values.yaml` for Helm to customize your application deployments.


