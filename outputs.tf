
# Add LB DNS name to outputs
output "Loadbalancer-DNS-URL" {
  value = aws_alb.application_load_balancer.dns_name
}