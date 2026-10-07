module "vpc" {
  source = "./modules/vpc"
  environment = var.environment
  azs = ["us-east-1a", "us-east-1b"]

}