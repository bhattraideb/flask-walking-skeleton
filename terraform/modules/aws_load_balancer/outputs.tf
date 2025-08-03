output "load_balancer_name" {
  value = aws_lb.main_load_balancer.name
}

output "target_group_arn" {
  value = aws_lb_target_group.load_balancer_target_group.arn
}

output "security_group_id" {
  value = aws_security_group.load_balancer_security_group.id
}

output "load_balancer_dns_name" {
  value = aws_lb.main_load_balancer.dns_name
}