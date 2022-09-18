
# Variables

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "ecs_cluster_name" {
  description = "Name of ECS Cluster"
  type        = string
  default     = "ecs-cluster"
}

# Sets AWS Region

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
}

# Security groups

variable "load_balancer_security_group" {
  description = "Security Group"
  type        = string
  default     = "load_balancer_sg"
}

variable "ecs_service_security_group" {
  description = "ECS Service Security Group"
  type        = string
  default     = "ecs_service_sg"
}

# Roles

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  type        = string
  default     = "myEcsTaskExecutionRole"
}

# ECS Service

variable "ecs_service_name" {
  description = "ECS service name"
  type        = string
  default     = "ecs_service"
}

# Profile

variable "profile" {
  description = "Profile (default)"
  type        = string
  default     = "default"
}

# Load Balancer

variable "load_balancer_name" {
  description = "Load Balancer name"
  type        = string
  default     = "ecs-lb"
}

variable "ecs_port" {
  description = "ECS port"
  type        = number
  default     = 80
}

variable "app_lb_tg" {}