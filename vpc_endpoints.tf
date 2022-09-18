
# VPC ENDPOINTS TO ECR

# ecr.api
resource "aws_vpc_endpoint" "ecr_api_endpoint" {
  count = 1 #var.ecr_api_endpoint_enable ? 1 : 0

  private_dns_enabled = true
  security_group_ids  = [aws_security_group.load_balancer_security_group.id]
  service_name        = "com.amazonaws.${var.region}.ecr.api"
  subnet_ids          = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id]
  vpc_endpoint_type   = "Interface"
  vpc_id              = aws_vpc.ecs_vpc.id
}

# ecr.dkr
resource "aws_vpc_endpoint" "ecr_dkr_endpoint" {
  count = 1 # var.ecr_dkr_endpoint_enable ? 1 : 0

  private_dns_enabled = true
  security_group_ids  = [aws_security_group.load_balancer_security_group.id]
  service_name        = "com.amazonaws.${var.region}.ecr.dkr"
  subnet_ids          = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id]
  vpc_endpoint_type   = "Interface"
  vpc_id              = aws_vpc.ecs_vpc.id
}