
resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service"                        # Naming our first service
  cluster         = aws_ecs_cluster.ecs_cluster.id       # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.ecs_task.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 3

  network_configuration {
    subnets          = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    assign_public_ip = true # Providing our containers with public IPs
  }
}