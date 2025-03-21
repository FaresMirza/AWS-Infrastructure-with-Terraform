output "aws_alb_arn" {
  value = aws_lb.my_alb.arn
}

output "dns_name" {
  value = aws_lb.my_alb.dns_name
}