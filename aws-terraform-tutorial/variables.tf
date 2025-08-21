variable "instance_name" {
  description = "Value of the EC2 instance's name tag"
  type        = string
  default     = "new_instance"

}

variable "instance_type" {
  description = "Value of the EC2 instance's type"
  type        = string
  default     = "t2.micro"
}