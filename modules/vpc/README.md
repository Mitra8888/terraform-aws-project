# VPC Module

Creates the network foundation:  a VPC with public and private subnets spread across multiple Availability Zones, an Internet Gateway, Public RT, Elastic IP, NAT gateway,Private RT.

## Resources

- `aws_vpc.main` - VPC with DNS support and DNS hostnames enabled
- `aws_subnet.public` - One public subnet per AZ (public IP on launch)
- `aws_subnet.private` - One private subnet per AZ (no public IPs)
- `aws_internet_gateway.main` - Internet access for the public subnets
- `aws_route_table.public` - Default route '0.0.0.0/0' -> Internet Gateway
- `aws_route_table_association.public` - Associates each public subnet with public route table
- `aws_eip.nat` - Elastic IP for nat gateway
- `aws_nat_gateway.main` - Internet access for the private subnets
- `aws_route_table.private` - Default route '0.0.0.0/0' -> Nat Gateway
- `aws_route_table_association.private` - Associates each private subnet with private route table

## Outputs
- `vpc_id` - ID of the VPC
- `public_subnet_ids` - List of public subnet IDs
- `private_subnet_ids` - List of private subnet IDs

## Usage
```
module "vpc" {
    source = "./modules/vpc"
    environment = var.environment
    azs = ["us-east-1a", "us-east-1b"]
}
```


## Design Notes
- **Single NAT Gateway** one NAT gateway in the first public subnet keeps cost low. If that AZ fails, private subnets in the other AZ lose outbound internet access. For prod, use one NAT gateway per AZ
- Subnets are created with `count` over CIDR lists, so adding an AZ means adding items to the lists in variables.tf