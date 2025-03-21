resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg]
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Name = "my-alb"
  }
}