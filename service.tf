
resource "aws_ecs_service" "ecs_service" {
  name            = "ecs-service"                        # Naming our first service
  cluster         = aws_ecs_cluster.ecs_cluster.id       # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.ecs_task.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 3

  network_configuration {
    subnets          = ["subnet-eb9d0082", "subnet-9e68dbe5", "subnet-e43303ae"]
    assign_public_ip = true # Providing our containers with public IPs
  }
}