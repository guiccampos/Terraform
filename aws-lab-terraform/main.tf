# Provider Block
provider "aws" {
  region = "us-east-1"
}

# Module Block
module "aws-lab-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "aws-lab-vpc"
  cidr = var.vpc_cidr

  azs             = ["us-east-1a"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  create_igw           = true
  enable_dns_hostnames = true
  enable_nat_gateway   = false

}


module "aws-lab-sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 5.0"

  name        = "aws-lab-security-group"
  description = "Security group for AWS-Lab with SSH ports open within VPC"
  vpc_id      = module.aws-lab-vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}


module "aws-lab-server-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"
  name    = "aws-lab-server"

  instance_type = var.server_type
  ami           = var.server_ami

  associate_public_ip_address = "true"
  subnet_id                   = module.aws-lab-vpc.public_subnets[0]
  key_name                    = "aws-keypair" # key_pair for SSH login

  monitoring             = "false"
  create_security_group  = "false"
  vpc_security_group_ids = [module.aws-lab-sg.security_group_id]



  tags = {
    Terraform = "true"
  }
}


# Data Block
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

# Resource Block
