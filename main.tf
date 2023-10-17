terraform {
  # Provider Settings - Define Terraform plugins specific to provider to create infrastructre. 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_instance" "app_server" {
  # ami is region specific 
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}
