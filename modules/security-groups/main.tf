resource "aws_security_group" "alb-security-group" {
  name        = "${var.environment}-alb-security-group"
  vpc_id      = var.vpc_id
  description = "Security group for the ALB"

  tags = {
    Name        = "${var.environment}-alb-security-group"
    Environment = var.environment
  }
}
resource "aws_security_group" "ecs-security-group" {
  name        = "${var.environment}-ecs-security-group"
  vpc_id      = var.vpc_id
  description = "Security group for the ECS tasks"

  tags = {
    Name        = "${var.environment}-ecs-security-group"
    Environment = var.environment
  }

}
resource "aws_security_group" "rds-security-group" {
  name        = "${var.environment}-rds-security-group"
  vpc_id      = var.vpc_id
  description = "Security group for the RDS instance"

  tags = {
    Name        = "${var.environment}-rds-security-group"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb-to-http" {
  security_group_id = aws_security_group.alb-security-group.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  description = "Allow HTTP traffic from the internet to the ALB security group"
}

resource "aws_vpc_security_group_ingress_rule" "alb-to-https" {
  security_group_id = aws_security_group.alb-security-group.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  description = "Allow HTTPS traffic from the internet to the ALB security group"
}

resource "aws_vpc_security_group_egress_rule" "alb-to-ecs" {
  security_group_id            = aws_security_group.alb-security-group.id
  from_port                    = var.app_port
  to_port                      = var.app_port
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.ecs-security-group.id

  description = "Allow application traffic from ALB security group to ECS security group"
}

resource "aws_vpc_security_group_ingress_rule" "ecs-from-alb" {
  security_group_id            = aws_security_group.ecs-security-group.id
  from_port                    = var.app_port
  to_port                      = var.app_port
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.alb-security-group.id

  description = "Allow application traffic from ALB security group to ECS security group"
}

resource "aws_vpc_security_group_egress_rule" "ecs-to-rds" {
  security_group_id            = aws_security_group.ecs-security-group.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.rds-security-group.id

  description = "Allow PostgreSQL traffic from ECS security group to RDS security group"
}

resource "aws_vpc_security_group_ingress_rule" "rds-from-ecs" {
  security_group_id            = aws_security_group.rds-security-group.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.ecs-security-group.id

  description = "Allow PostgreSQL traffic from ECS security group to RDS security group"
}