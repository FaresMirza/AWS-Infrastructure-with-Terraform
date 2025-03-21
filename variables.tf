
#Region Selection
variable "aws_region" {
  type = string
}
#Shared Creds
variable "aws_creds" {
  type = string
}

#Vpc cidr
variable "vpc_cidr" {
  type = string
}

#Subnets
variable "subnets" {
  type = map(string)
}

#Instance Type
variable "instance_type" {
  type = string
}

#AMI ID 
variable "ami_id" {
  type = string
}

#GIT REPO
variable "git_repo" {
  type = string
}

#Auto Scaling Group Desired Capactiy
variable "asg_desired_capicty" {
  type = number
}

#Auto Scaling Group Max Capacity
variable "asg_max_size" {
  type = number
}

#Auto Scaling Group Min Capacity
variable "asg_min_size" {
  type = number
}