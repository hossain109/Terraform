terraform {
  backend "s3" {
    bucket = "sohrab-s3-demo-xyz"
    region = "us-east-1"
    key = "sohrab/terraform.tfstate"
    dynamodb_table = "terraform_lock"
    
  }
}