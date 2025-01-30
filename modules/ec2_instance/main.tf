provider "aws" {
  region = "us-east-1"
}

resource "aws_default_vpc" "vpc_value" {
  tags = {
    Name = "Default_VPC"
  }
}


resource "aws_instance" "instace_vlaue" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = var.subnet_id_value
}