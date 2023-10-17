variable "region" {
  type    = string
  default = "ap-south-1"
}


variable "ami" {
  type    = string
  default = "ami-0f2e255ec956ade7f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "name" {
  type    = string
  default = "ExampleServerInstance"
}
