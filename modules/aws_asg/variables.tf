variable "subnets" {
  type = list(string)
}
variable "my_tg" {
  type = string
}
variable "my_lt" {
  type = string
}

variable "asg_desired_capicty" {
  type = number
}

variable "asg_max_size" {
  type = number
}

variable "asg_min_size" {
  type = number
}