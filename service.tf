
resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service"                        # Naming our first service
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
    subnets          = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    assign_public_ip = true # Providing our containers with public IPs
  }
}