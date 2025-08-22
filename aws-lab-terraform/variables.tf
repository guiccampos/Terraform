variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "40.0.0.0/16"
}

variable "private_subnets" {
  description = "VPC private subnets"
  type        = list(string)
  default     = ["40.0.2.0/24"]
}

variable "public_subnets" {
  description = "VPC public subnets"
  type        = list(string)
  default     = ["40.0.1.0/24"]
}

variable "server_ami" {
  description = "Server EC2 Instance AMI"
  type        = string
  default     = "ami-0360c520857e3138f"
}

variable "server_type" {
  description = "Server EC2 Instance type"
  type        = string
  default     = "t2.micro"
}
