# Security Groups Module

Creates the network access control for the application stack

## Resources

- `aws_security_group.alb-security-group` - Security group for the ALB
- `aws_security_group.ecs-security-group` - Security group for the ECS tasks
- `aws_security_group.rds-security-group` - Security group for the RDS instance
- `aws_vpc_security_group_ingress_rule.alb-to-http` - HTTP (80) from the internet to the ALB
- `aws_vpc_security_group_ingress_rule.alb-to-https` - HTTPS (443) from the internet to the ALB
- `aws_vpc_security_group_egress_rule.alb-to-ecs` - ALB to ECS on `app_port`
- `aws_vpc_security_group_ingress_rule.ecs-from-alb` - ECS accepts `app_port` only from the ALB security group
- `aws_vpc_security_group_egress_rule.ecs-to-rds` - ECS to RDS on 5432
- `aws_vpc_security_group_ingress_rule.rds-from-ecs` - RDS accepts 5432 only from the ECS security group

## Usage

```
module "security_groups" {
    source = "./modules/security-groups"
    environment = var.environment
    vpc_id
}
```

## Outputs

`alb_security_group_id` - ID of the ALB security group
`ecs_security_group_id` - ID of the ECS security group
`rds_security_group_id` - ID of the RDS security group

## Design Notes