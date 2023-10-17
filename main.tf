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

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  # ami is region specific 
  ami           = "ami-0f2e255ec956ade7f"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
