# VPC Module

Creates the network foundation:  a VPC with public and private subnets spread across multiple Availability Zones, an Internet Gateway and a public route table.

## Resources

'aws_vpc.main' - VPC with DNS support and DNS hostnames enabled
'aws_subnet.public' - One public subnet per AZ (public IP on launch)
'aws_subnet.private' - One private subnet per AZ (no public IPs)
'aws_internet_gateway.main' - Internet access for the public subnets
'aws_route_table.public' - Default route '0.0.0.0/0' -> Intrnet Gateway
'aws_route_table_association.public - Associates each public subnet with public route table

