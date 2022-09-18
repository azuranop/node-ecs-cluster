
# Application Load Balancer

resource "aws_alb" "application_load_balancer" {
  provider           = aws.region
  name               = var.load_balancer_name
  load_balancer_type = "application"
  subnets = [ # Referencing the default subnets
    "${aws_subnet.private_subnet_1.id}",
    "${aws_subnet.private_subnet_2.id}",
    "${aws_subnet.private_subnet_3.id}"
  ]
  # Referencing the security group
  security_groups = ["${aws_security_group.load_balancer_security_group.id}"]

  tags = {
    Name = "ECS-Application-LB"
  }
}

# Creating a security group for the load balancer:
resource "aws_security_group" "load_balancer_security_group" {

  name        = var.load_balancer_security_group
  description = "ECS Allowed Ports"
  vpc_id      = aws_vpc.ecs_vpc.id

  ingress {
    from_port   = var.ecs_port # Allowing traffic in from port 80
    to_port     = var.ecs_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}