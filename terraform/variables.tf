# Infrastructure-related variables

variable "aws_region" {
  description = "The AWS region to create the infrastructure in."
  type        = string
  default     = "eu-west-1"  
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "EKS Cluster version."
  type        = string
  default     = "1.30"
}

variable "availability_zones" {
  description = "Availability zones to use in the region."
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "private_subnets" {
  description = "Private subnets for the VPC."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "public_subnets" {
  description = "Public subnets for the VPC."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}



variable "node_desired_capacity" {
  description = "Desired number of worker nodes in the EKS cluster."
  type        = number
  default     = 2
}

variable "node_min_capacity" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 1
}

variable "node_max_capacity" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3
}


variable "instance_type" {
  description = "EC2 instance type for the EKS worker nodes."
  type        = string
  default     = "t3.medium"  # Cost-effective, change if needed
}


variable "environment" {
  description = "Environment name (dev, prod, etc.)."
  type        = string
  default     = "dev"
}

# Application-specific variables

variable "nodejs_image_repository" {
  description = "Docker image repository for the NodeJS app"
  type        = string
  default     = "idan5567/nodejs-app"
}

variable "nodejs_image_tag" {
  description = "Docker image tag for the NodeJS app"
  type        = string
  default     = "latest"
}

variable "nodejs_replica_count" {
  description = "Number of replicas for the NodeJS app"
  type        = number
  default     = 2
}

variable "mongodb_image_repository" {
  description = "Docker image repository for the MongoDB app"
  type        = string
  default     = "mongo"
}

variable "mongodb_image_tag" {
  description = "Docker image tag for the MongoDB app"
  type        = string
  default     = "4.2"
}

variable "mongodb_replica_count" {
  description = "Number of replicas for MongoDB"
  type        = number
  default     = 1
}
