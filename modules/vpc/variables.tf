variable cidr_block {
    description = "The CIDR block for the VPC"
    type = string
    default = "10.0.0.0/16"
}

variable environment {
    description = "The environment currently working in"
    type = string
    default = "dev"
}

variable region {
    description = "The aws region to deploy resources in"
    type = string
    default = "us-east-1"
}

variable azs {
    description = "The availability zones to deploy resources in"
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}

variable public_subnet_cidrs {
    description = "The CIDR blocks for the public subnets"
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable private_subnet_cidrs{
    description = "The CIDR blocks for the private subnets"
    type = list(string)
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}