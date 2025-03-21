
#VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
}

#Route table ID
output "route_table_id" {
  value = module.vpc.default_route_table_id
}