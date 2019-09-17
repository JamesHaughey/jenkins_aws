//Global variables
variable "region" {
  description = "AWS region"
  default = "eu-west-1"
}

variable "shared_credentials_file" {
  description = "AWS credentials file path"
  default = "C:\\Users\\Tiago\\.aws\\credentials"
}

variable "aws_profile" {
  description = "AWS profile"
  default = "terraform"
}

variable "bastion_key_name" {
  description = "Bastion KeyName"
  default = "ryzen_ireland_pair"
}

variable "availability_zones" {
  type        = "list"
  description = "List of Availability Zones"
  default = ["eu-west-1a", "eu-west-1b"]
}

// Default variables
variable "vpc_name" {
  description = "VPC name"
  default     = "jenkins_aws"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_count" {
  default     = 2
  description = "Number of public subnets"
}

variable "private_count" {
  default     = 2
  description = "Number of private subnets"
}

variable "bastion_instance_type" {
  description = "Bastion Instance type"
  default     = "t2.micro"
}
