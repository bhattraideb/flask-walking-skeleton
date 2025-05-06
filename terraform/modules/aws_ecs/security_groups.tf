resource "aws_security_group" "ecs_service_security_group" {
  description = "AWS for the ECS Service"
  name        = "${var.prefix}-ecs-service"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.private_cidr_block
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 5000
    to_port   = 5000
    protocol  = "tcp"
    security_groups = [
      var.load_balancer_security_group_id
    ]
  }
}