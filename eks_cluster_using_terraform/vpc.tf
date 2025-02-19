data "aws_availability_zones" "available" { }

locals {
  cluster_name = "hossain-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length = 4
  special = false
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"

  name = "my-vpc"
  cidr = var.vpc_cidr

  azs             = module.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}