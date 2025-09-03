output "aws_lab_server_public_ip" {
  description = "Server EC2 Instance Public IP"
  value       = module.aws-lab-server-ec2.public_ip
}

output "aws_lab_vpc_id" {
  description = "VPC ID"
  value       = module.aws-lab-vpc.vpc_id
}

output "aws_lab_public_subnet_id"{
  description = "VPC public subnet ID"
  value = module.aws-lab-vpc.public_subnets
}

output "aws_lab_sg_id" {
  description = "Security Group ID"
  value       = module.aws-lab-sg.security_group_id
}
