terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "mitra88-org"

    workspaces {
      name = "aws-infrastructure"
    }
  }
}