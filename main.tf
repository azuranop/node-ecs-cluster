provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

/*resource "aws_ecr_repository" "ecr_repo" {
  name = "ecr-repo" # Naming my repository
}*/

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name # Naming the cluster
}

