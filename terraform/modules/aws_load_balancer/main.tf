# load balancer main definition
resource "aws_lb" "main_load_balancer" {
  name                       = "${var.prefix}-app"
  internal                   = false
  load_balancer_type         = var.load_balancer_type
  security_groups            = [aws_security_group.load_balancer_security_group.id]
  enable_deletion_protection = false

  subnets = var.public_subnet_ids

  #  access_logs {
  #    bucket  = aws_s3_bucket.lb_logs.id
  #    prefix  = "test-lb"
  #    enabled = true
  #  }
}

# target group
resource "aws_lb_target_group" "load_balancer_target_group" {
  name        = "app-target-group"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  port        = 80

  health_check {
    path = "/fizzbuzz/5"
    protocol = "HTTP"
    matcher  = "200"
    interval = 30
    timeout  = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "http_load_balancer_listener" {
  load_balancer_arn = aws_lb.main_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    #    type             = "redirect"
    #    redirect {
    #      port        = "443"
    #      protocol    = "HTTPS"
    #      status_code = "HTTP_301"
    #    }
    target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
  }
}

## certificate
#data "aws_acm_certificate" "certificate" {
#  count       = var.domain != "" ? 1 : 0
#  domain      = var.domain
#  statuses    = ["ISSUED", "PENDING_VALIDATION"]
#  most_recent = true
#}
#
## extra certificates
#data "aws_acm_certificate" "extra_certificates" {
#  for_each    = { for domain in var.extra_domains : domain => domain }
#  domain      = each.value
#  statuses    = ["ISSUED"]
#  most_recent = true
#}
#
#resource "aws_lb_listener_certificate" "alb_https_extra_certificates" {
#  for_each        = var.tls ? { for domain in var.extra_domains : domain => domain } : {}
#  listener_arn    = aws_lb_listener.https_load_balancer_listener.arn
#  certificate_arn = data.aws_acm_certificate.extra_certificates[each.value].arn
#}


#######A certificate must be specified for HTTPS listeners ##############
#resource "aws_lb_listener" "https_load_balancer_listener" {
#  load_balancer_arn = aws_lb.main_load_balancer.arn
#  port              = 443
#  protocol          = "HTTPS"
##  certificate_arn   = data.aws_acm_certificate.certificate.arn
#
#  default_action {
##    type             = "forward"
#    type             = "redirect"
#    redirect {
#      port        = "443"
#      protocol    = "HTTPS"
#      status_code = "HTTP_301"
#    }
#    target_group_arn = aws_lb_target_group.load_balancer_target_group.arn
#  }
#}


