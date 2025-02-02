provider "aws" {
    region = "us-east-1"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
}