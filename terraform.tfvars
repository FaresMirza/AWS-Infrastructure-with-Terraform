
#Region Selection
aws_region = "me-south-1"

#Shared Creds
aws_creds = "/Users/fares/.aws/credentials"

#VPC CIDR
vpc_cidr = "10.0.0.0/24"

#Subnets
subnets = {
  "me-south-1a" = "10.0.10.0/24",
  "me-south-1b" = "10.0.20.0/24",
  "me-south-1c" = "10.0.30.0/24"
}

#AMI ID
ami_id = "ami-0f29bb40035eb2a58"

#Instance Type
instance_type = "t3.micro"

#git repo
git_repo = "https://github.com/FaresMirza/Express.git"

#auto scaling group desired capacity
asg_desired_capicty = 2

#auto scaling group max capacity
asg_max_size        = 4

#auto scaling group min capacity
asg_min_size        = 2