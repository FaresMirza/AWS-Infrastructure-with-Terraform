
#Region Selection
#Example
# me-south-1
aws_region = ""

#Shared Creds
#Example
#/Users/fares/.aws/credentials
aws_creds = ""

#VPC CIDR
#Example
#10.0.0.0/24
vpc_cidr = ""

#Subnets
#Example
# Subnet = {
#"me-south-1a" = "10.0.10.0/24",
# "me-south-1b" = "10.0.20.0/24",
#"me-south-1c" = "10.0.30.0/24"
# }
subnets = {
  
}

#AMI ID
#EXAMPLE
#ami-0f29bb40035eb2a58
ami_id = ""

#Instance Type
#EXAMPLE
#t3.micro
instance_type = ""

#git repo
#EXAMPLE
#https://github.com/FaresMirza/Express.git
git_repo = "https://github.com/<Put Your User Name>/<ProjectName>.git"

#auto scaling group desired capacity
asg_desired_capicty = 0

#auto scaling group max capacity
asg_max_size        = 0

#auto scaling group min capacity
asg_min_size        = 0