provider "aws" {
  region = "us-east-1"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "sohrab" {
  instance_type= "t2.micro"
  ami="ami-04b4f1a9cf54c11d0"
  subnet_id="subnet-0d29eeca65361af87"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "sohrab-s3-demo-xyz"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name             = "terraform_lock"
  hash_key         = "LOCKID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LOCKID"
    type = "S"
  }
}
