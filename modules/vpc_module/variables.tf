
#VPC Name
variable "vpc_name" {
  type    = string
  default = "VPC (NOT DEFAULT)"
}

variable "create_igw" {
  type    = bool
  default = true
}


