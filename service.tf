
resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name                        # Naming our first service
  cluster         = aws_ecs_cluster.ecs_cluster.id       # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.ecs_task.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 3

  # Reference to targets groups
  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn # Referencing our target group
    container_name   = aws_ecs_task_definition.ecs_task.family
    container_port   = 3000 # Specifying the container port
  }

  network_configuration {
    subnets          = ["${aws_subnet.private_subnet_1.id}", "${aws_subnet.private_subnet_2.id}", "${aws_subnet.private_subnet_3.id}"]
    assign_public_ip = true # Providing our containers with public IPs
  }
}

# Security Group for the ECS service that allows traffic only from the application load balancer security group

resource "aws_security_group" "service_security_group" {

  name        = var.ecs_service_security_group
  description = "ECS Allowed Ports"
  vpc_id      = aws_vpc.ecs_vpc.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Only allowing traffic in from the load balancer security group
    security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
  }

  egress {
    from_port   = 0             # Allowing any incoming port
    to_port     = 0             # Allowing any outgoing port
    protocol    = "-1"          # Allowing any outgoing protocol
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}