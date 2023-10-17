terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

resource "aws_instance" "app_server" {
  count         = length(var.name)
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.name[count.index]
  }
}
