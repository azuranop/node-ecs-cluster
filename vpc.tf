# Providing a reference to our default VPC
resource "aws_vpc" "vpc-4f078526" {
}

# Providing a reference to our default subnets
resource "aws_subnet" "subnet-eb9d0082" {
  availability_zone = "eu-central-1a"
}

resource "aws_subnet" "subnet-9e68dbe5" {
  availability_zone = "eu-central-1b"
}

resource "aws_subnet" "subnet-e43303ae" {
  availability_zone = "eu-central-1c"
}