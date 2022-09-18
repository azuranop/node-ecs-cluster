
# Target group

resource "aws_lb_target_group" "target_group" {
  name        = var.app_lb_tg
  port        = var.ecs_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.ecs_vpc.id # Referencing the default VPC
  health_check {
    matcher = "200,301,302"
    path    = "/"
  }
  tags = {
    Name = "application-load-balancer-target-group"
  }
}

resource "aws_lb_listener" "listener" {
  provider          = aws.region
  load_balancer_arn = aws_alb.application_load_balancer.arn # Referencing our load balancer
  port              = var.ecs_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn # Referencing our target group
  }

  depends_on = [aws_alb.application_load_balancer]
}