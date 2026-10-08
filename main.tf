module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
  azs         = ["us-east-1a", "us-east-1b"]

}

module "security_groups" {
  source      = "./modules/security-groups"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
}