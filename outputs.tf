output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_secondary_cidr_blocks" {
  value = module.vpc.vpc_secondary_cidr_blocks
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "private_subnet_name_map" {
  value = module.vpc.private_subnet_name_map
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "public_subnet_name_map" {
  value = module.vpc.public_subnet_name_map
}

output "private_route_table_id" {
  value = module.vpc.private_route_table_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}
