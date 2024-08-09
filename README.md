AWS Basic Account VPC module

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../aws-vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | n/a | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | n/a | `bool` | `true` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `true` | no |
| <a name="input_network_acl_egress"></a> [network\_acl\_egress](#input\_network\_acl\_egress) | Egress network ACL rules | `list(any)` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_network_acl_ingress"></a> [network\_acl\_ingress](#input\_network\_acl\_ingress) | Ingress network ACL rules | `list(any)` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_private_subnet_list"></a> [private\_subnet\_list](#input\_private\_subnet\_list) | Example:<br><br>[<br>  {<br>    cidr\_block = "172.20.221.0/24"<br>    availability\_zone = "us-west-2a"<br>  },<br>  {<br>    cidr\_block = "172.20.222.0/24"<br>    availability\_zone = "us-west-2b"<br>  }<br>] | <pre>list(object({<br>    cidr_block        = string,<br>    availability_zone = string<br>  }))</pre> | <pre>[<br>  {<br>    "availability_zone": "us-east-1a",<br>    "cidr_block": "10.10.50.0/24"<br>  },<br>  {<br>    "availability_zone": "us-east-1b",<br>    "cidr_block": "10.10.60.0/24"<br>  },<br>  {<br>    "availability_zone": "us-east-1c",<br>    "cidr_block": "10.10.70.0/24"<br>  }<br>]</pre> | no |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | Additional Private Subnet Tags | `map(string)` | <pre>{<br>  "kubernetes.io/role/internal-elb": "1"<br>}</pre> | no |
| <a name="input_public_subnet_list"></a> [public\_subnet\_list](#input\_public\_subnet\_list) | Example:<br><br>[<br>  {<br>    cidr\_block = "172.20.220.0/25"<br>    availability\_zone = "us-west-2a"<br>  },<br>  {<br>    cidr\_block = "172.20.220.128/26"<br>    availability\_zone = "us-west-2b"<br>  }<br>] | <pre>list(object({<br>    cidr_block        = string,<br>    availability_zone = string<br>  }))</pre> | <pre>[<br>  {<br>    "availability_zone": "us-east-1a",<br>    "cidr_block": "10.10.10.0/24"<br>  },<br>  {<br>    "availability_zone": "us-east-1b",<br>    "cidr_block": "10.10.20.0/24"<br>  },<br>  {<br>    "availability_zone": "us-east-1c",<br>    "cidr_block": "10.10.30.0/24"<br>  }<br>]</pre> | no |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | Additional Public Subnet Tags | `map(string)` | <pre>{<br>  "kubernetes.io/role/elb": "1"<br>}</pre> | no |
| <a name="input_secondary_private_subnet_list"></a> [secondary\_private\_subnet\_list](#input\_secondary\_private\_subnet\_list) | Example:<br><br>[<br>  {<br>    cidr\_block = "172.20.221.0/24"<br>    availability\_zone = "us-west-2a"<br>  },<br>  {<br>    cidr\_block = "172.20.222.0/24"<br>    availability\_zone = "us-west-2b"<br>  }<br>] | <pre>list(object({<br>    cidr_block        = string<br>    availability_zone = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | n/a | `string` | `"10.10.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC | `any` | n/a | yes |
| <a name="input_vpc_secondary_cidr_blocks"></a> [vpc\_secondary\_cidr\_blocks](#input\_vpc\_secondary\_cidr\_blocks) | n/a | `list(string)` | `[]` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | Additional VPC tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | n/a |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | n/a |
| <a name="output_private_subnet_name_map"></a> [private\_subnet\_name\_map](#output\_private\_subnet\_name\_map) | n/a |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
| <a name="output_public_subnet_name_map"></a> [public\_subnet\_name\_map](#output\_public\_subnet\_name\_map) | n/a |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_secondary_cidr_blocks"></a> [vpc\_secondary\_cidr\_blocks](#output\_vpc\_secondary\_cidr\_blocks) | n/a |
<!-- END_TF_DOCS -->
