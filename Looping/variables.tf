variable "ami" {
  type    = string
  default = "ami-0f2e255ec956ade7f"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "name" {
  type    = list(string)
  default = ["ExampleSever1"]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
