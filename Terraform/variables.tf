variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The EC2 instance type."
  default     = "t2.micro"
}

variable "key_name" {
  description = "The EC2 key pair name."
  default     = "Login"
}
