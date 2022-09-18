
# Routing table

# Internet Gateway for the public subnet
resource "aws_internet_gateway" "gw" {
  provider = aws.region
  vpc_id   = aws_vpc.ecs_vpc.id

  tags = {
    Name = "Main internet gateway"
  }
}

resource "aws_route_table" "web" {
  vpc_id = aws_vpc.ecs_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Net rules"
  }
}

#Get all available AZ's in VPC for master region
data "aws_availability_zones" "azs" {
  provider = aws.region
  state    = "available"
}