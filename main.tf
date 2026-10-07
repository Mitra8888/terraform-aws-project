resource "aws_instance" "web_server" {
  ami           = var.amazon_linux_ami
  instance_type = var.instance_type


  tags = {
    Environment = var.environment
    Name        = "web_application_server"
    Terraform   = "true"
  }
}