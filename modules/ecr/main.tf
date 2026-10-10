resource "aws_ecr_repository" "main" {
    name = "${var.environment}-ecr-repo"
    image_tag_mutability = "MUTABLE" #IMMUTABLE IN PROD
    force_delete = true
    image_scanning_configuration {
        scan_on_push = true
    }

    tags = {
        Name = "${var.environment}-ecr-repo"
        Environment = var.environment
    }
}

resource "aws_ecr_lifecycle_policy" "main_policy" {
    repository = aws_ecr_repository.main.name

    policy = jsonencode({
        rules = [
            {
                rulePriority = 1
                description = "Keep only 10 images"
                selection = {
                    tagStatus = "any"
                    countType = "imageCountMoreThan"
                    countNumber = 10
                }
                action = {
                    type = "expire"
                }
            }
        ]
    })
}