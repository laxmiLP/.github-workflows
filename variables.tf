variable "AccountNum" {
  type        = number
  description = "SCDM project"
  sensitive   = true
  default = 786678469955
}

variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-west-2"
}

variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key"
  sensitive   = true
}


# VPC
variable "vpc_name" {
  default = "scdm"
}

variable "vpc_cidr_block" {
  default = "10.10.0.0/16"
}

variable "vpc_secondary_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}

# Subnets
variable "public_subnet_list" {
  type = list(object({
    cidr_block        = string,
    availability_zone = string
  }))

  description = <<DESCRIPTION
Example:

[
  {
    cidr_block = "172.20.220.0/25"
    availability_zone = "us-west-2a"
  },
  {
    cidr_block = "172.20.220.128/26"
    availability_zone = "us-west-2b"
  }
]
DESCRIPTION

  default = [
    {
      cidr_block        = "10.10.10.0/24"
      availability_zone = "us-west-2a"
    },
    {
      cidr_block        = "10.10.20.0/24"
      availability_zone = "us-west-2b"
    },
    {
      cidr_block        = "10.10.30.0/24"
      availability_zone = "us-west-2c"
    }
  ]
}

variable "private_subnet_list" {
  type = list(object({
    cidr_block        = string,
    availability_zone = string
  }))

  description = <<DESCRIPTION
Example:

[
  {
    cidr_block = "172.20.221.0/24"
    availability_zone = "us-west-2a"
  },
  {
    cidr_block = "172.20.222.0/24"
    availability_zone = "us-west-2b"
  }
]
DESCRIPTION

  default = [
    {
      cidr_block        = "10.10.50.0/24"
      availability_zone = "us-west-2a"
    },
    {
      cidr_block        = "10.10.60.0/24"
      availability_zone = "us-west-2b"
    },
    {
      cidr_block        = "10.10.70.0/24"
      availability_zone = "us-west-2c"
    }
  ]

}

variable "secondary_private_subnet_list" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
  }))

  description = <<DESCRIPTION
Example:

[
  {
    cidr_block = "172.20.221.0/24"
    availability_zone = "us-west-2a"
  },
  {
    cidr_block = "172.20.222.0/24"
    availability_zone = "us-west-2b"
  }
]
DESCRIPTION

  default = []
}

# Network ACLs
variable "network_acl_egress" {
  description = "Egress network ACL rules"
  type        = list(any)

  default = [
    {
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
    }
  ]
}

variable "network_acl_ingress" {
  description = "Ingress network ACL rules"
  type        = list(any)

  default = [
    {
      rule_no    = 100
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
    }
  ]
}

# Tags
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for all resources"
}

variable "vpc_tags" {
  type        = map(string)
  default     = {}
  description = "Additional VPC tags"
}

variable "private_subnet_tags" {
  type = map(string)
  default = {
    "kubernetes.io/role/internal-elb" = "1"
  }
  description = "Additional Private Subnet Tags"
}

variable "public_subnet_tags" {
  type = map(string)
  default = {
    "kubernetes.io/role/elb" = "1"
  }
  description = "Additional Public Subnet Tags"
}

# Nat Gateway
variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}
