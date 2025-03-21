
#Create VPC
module "aws_vpc" {
  source = "./modules/vpc_module"
}

#Create IGW
module "aws_internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.aws_vpc.vpc_id
}

#Create Subnets
module "aws_subnet" {
  vpc_id  = module.aws_vpc.vpc_id
  source  = "./modules/subnet_module"
  subnets = var.subnets
}

#Create AWS ROUTE ASSOCIATION
module "aws_route_association" {
  source         = "./modules/route_table"
  subnet_id      = module.aws_subnet.subnet_ids
  route_table_id = module.aws_vpc.route_table_id
}

#Create AWS ROUTES
module "aws_route_routes" {
  source         = "./modules/aws_routes"
  igw            = module.aws_internet_gateway.igw_id
  route_table_id = module.aws_vpc.route_table_id
}

#CREATE SECURITY GROUP FOR EC2
module "aws_security_group" {
  vpc_id = module.aws_vpc.vpc_id
  source = "./modules/security_group_ec2"
  alb_sg = module.aws_security_group_alb.alb_sg_id
}

#CREATE SECURITY GROUP FOR ALB
module "aws_security_group_alb" {
  source = "./modules/security_group_alb"
  vpc_id = module.aws_vpc.vpc_id
}

#CREATE ALB
module "aws_alb" {
  source  = "./modules/aws_alb"
  alb_sg  = module.aws_security_group_alb.alb_sg_id
  subnets = module.aws_subnet.subnet_ids
}

#CREATE TARGET GROUP
module "aws_lb_target_group" {
  source = "./modules/target_group"
  vpc_id = module.aws_vpc.vpc_id
}

#CREATE ALB LISTNER
module "aws_alb_listner" {
  source  = "./modules/aws_alb_listener"
  alb_arn = module.aws_alb.aws_alb_arn
  tg_arn  = module.aws_lb_target_group.target_group_arn
}

#CREATE LAUNCH TEMPLETE
module "aws_launch_template" {
  source         = "./modules/aws_lt"
  instance_sg_id = module.aws_security_group.sg_id
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  key_pair       = module.aws_key_pair.key_pair
  git_repo       = var.git_repo
}
#Create Key Pair
module "aws_key_pair" {
  source = "./modules/key_pair"
}
#CREATE AUTO SCALING GROUP
module "aws_asg" {
  source              = "./modules/aws_asg"
  my_tg               = module.aws_lb_target_group.target_group_arn
  subnets             = module.aws_subnet.subnet_ids
  my_lt               = module.aws_launch_template.aws_lt_id
  asg_desired_capicty = var.asg_desired_capicty
  asg_max_size        = var.asg_max_size
  asg_min_size        = var.asg_min_size
}

