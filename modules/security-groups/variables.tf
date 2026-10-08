variable "environment" {
  description = "The environment currently working in"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "The ID of the VPC to create the security groups in"
  type        = string
}

variable "app_port" {
  description = "The port on which the ECS application is running"
  type        = number
  default     = 8080
}