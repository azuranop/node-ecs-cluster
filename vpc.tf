

# VPC

resource "aws_vpc" "ecs_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "VPC for ecs"
  }
}

/*
# Providing a reference to our default subnets
resource "aws_subnet" "subnet-eb9d0082" {
  availability_zone = var.vpc_azs[0]
}
*/

#
resource "aws_subnet" "private_subnet_1" {
  provider          = aws.region
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = element(data.aws_availability_zones.azs.names, 0)

  tags = {
    Name = "Private subnet 1"
  }
}


resource "aws_subnet" "private_subnet_2" {
  provider          = aws.region
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = element(data.aws_availability_zones.azs.names, 1)

  tags = {
    Name = "Private subnet 2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  provider          = aws.region
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = element(data.aws_availability_zones.azs.names, 2)

  tags = {
    Name = "Private subnet 3"
  }
}