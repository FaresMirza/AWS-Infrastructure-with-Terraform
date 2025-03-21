module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = var.vpc_name
}