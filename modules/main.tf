provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-04b4f1a9cf54c11d0"
  subnet_id_value = "subnet-02d5ba1352c2a98bf"
  instance_type_value ="t2.micro"

}