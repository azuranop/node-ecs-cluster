
# Main

provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name # Naming the cluster
}

