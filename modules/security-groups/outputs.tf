output "alb_security_group_id" {
    value = aws_security_group.alb-security-group.id
}

output "ecs_security_group_id" {
    value = aws_security_group.ecs-security-group.id
}

output "rds_security_group_id" {
    value = aws_security_group.rds-security-group.id
}
