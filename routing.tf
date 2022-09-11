
# Routing table

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ecs_vpc.id

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