provider "aws" {
  region = "us-east-1"  #define aws region 
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "this" {
  ami                     = "ami-04b4f1a9cf54c11d0"
  instance_type           = "t2.micro"
  subnet_id = "subnet-02bf7ca25ea43aa1c"
}