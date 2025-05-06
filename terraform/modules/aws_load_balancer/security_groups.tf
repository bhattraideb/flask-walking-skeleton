resource "aws_security_group" "load_balancer_security_group" {
  name        = "${var.prefix}-load-balancer-security-group"
  vpc_id      = var.vpc_id
  description = "Security group for ${var.prefix}-load-balancer"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
