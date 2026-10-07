variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment currently working in"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "amazon_linux_ami" {
  description = "The Amazon Linux ami id"
  type        = string
  default     = "ami-0d27e0fb3bac4d724"
}
