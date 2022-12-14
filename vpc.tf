# Providing a reference to our default VPC
#resource "aws_vpc" "vpc-4f078526" {
#}

resource "aws_vpc" "ecs_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "VPC for ecs"
  }
}

/*
# Providing a reference to our default subnets
resource "aws_subnet" "subnet-eb9d0082" {
  availability_zone = var.vpc_azs[0]
}

resource "aws_subnet" "subnet-9e68dbe5" {
  availability_zone = var.vpc_azs[1]
}

resource "aws_subnet" "subnet-e43303ae" {
  availability_zone = var.vpc_azs[2]
}
*/

#
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "private subnet 1"
  }
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "private subnet 2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.region}c"

  tags = {
    Name = "private subnet 3"
  }
}