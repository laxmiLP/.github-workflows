provider "aws" {
#access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

module "vpc" {
  source = "../aws-vpc"

  vpc_name                      = var.vpc_name
  vpc_cidr_block                = var.vpc_cidr_block
  vpc_secondary_cidr_blocks     = var.vpc_secondary_cidr_blocks
  enable_dns_hostnames          = var.enable_dns_hostnames
  enable_dns_support            = var.enable_dns_support
  public_subnet_list            = var.public_subnet_list
  private_subnet_list           = var.private_subnet_list
  network_acl_egress            = var.network_acl_egress
  network_acl_ingress           = var.network_acl_ingress
  tags                          = var.tags
  vpc_tags                      = var.vpc_tags
  public_subnet_tags            = var.public_subnet_tags
  private_subnet_tags           = var.private_subnet_tags
  secondary_private_subnet_list = var.secondary_private_subnet_list
  enable_nat_gateway            = var.enable_nat_gateway
}
