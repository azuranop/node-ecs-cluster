
#Set S3 backend for persisting TF state file remotely, ensure bucket already exits
# And that AWS user being used by TF has read/write perms
terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.37"
    }
  }
  backend "s3" {
    region  = "eu-central-1"
    profile = "default"
    key     = "terraformstatefile"
    bucket  = "terraform-azp"
  }

}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name # Naming the cluster
}

