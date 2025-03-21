#VPC ID
variable "vpc_id" {
  type = string
}

#Subnets
variable "subnets" {
  type = map(string)
}

#Public Ip on launch
variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

