resource "aws_autoscaling_group" "my_asg" {
  name                = "my-asg"
  desired_capacity    = var.asg_desired_capicty
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  vpc_zone_identifier = var.subnets
  target_group_arns   = [var.my_tg]

  launch_template {
    id      = var.my_lt
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "my-asg-instance"
    propagate_at_launch = true
  }
}