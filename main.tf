provider "aws" {
  version = "~> 2.0"
  region  = "eu-central-1" # Setting my region to London. Use your own region here
}

/*resource "aws_ecr_repository" "ecr_repo" {
  name = "ecr-repo" # Naming my repository
}*/

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster" # Naming the cluster
}

