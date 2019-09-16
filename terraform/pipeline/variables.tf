// Global variables

variable "region" {
  description = "AWS region"
  default = "eu-west-1"
}

variable "shared_credentials_file" {
  description = "AWS credentials file path"
  default = "None"
}

variable "aws_profile" {
  description = "AWS profile"
  default = "terraform"
}

variable "bastion_sg_id" {
  description = "Bastion security group ID"
  default = "n/a"
}

variable "jenkins_username" {
  description = "Jenkins username"
  default = "n/a"
}

variable "jenkins_password" {
  description = "Jenkins password"
  default = "n/a"
}

variable "jenkins_credentials_id" {
  description = "Slaves SSH ID"
  default = "n/a"
}

variable "vpc_id" {
  description = "VPC ID"
  default = "vpc-952f01f3"
}

variable "vpc_private_subnets" {
  description = "List of VPC private subnets"
  type        = "list"
  default     = ["subnet-06d87d5c"]
}

variable "vpc_public_subnets" {
  description = "List of VPC Public subnets"
  type        = "list"
  default     = ["subnet-06d87d5c"]
}

variable "hosted_zone_id" {
  description = "slowcoder.com route53 zone id"
  default = "n/a"
}

variable "ssl_arn" {
  description = "SSL certificate"
  default = "n/a"
}

// Default variables

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "SSH KeyPair"
  default = "n/a"
}

// Jenkins Master

variable "jenkins_master_instance_type" {
  description = "Jenkins Master instance type"
  default     = "t2.large"
}

// Jenkins Slaves

variable "jenkins_slave_instance_type" {
  description = "Jenkins Slave instance type"
  default     = "t2.micro"
}

variable "min_jenkins_slaves" {
  description = "Min slaves"
  default     = "3"
}

variable "max_jenkins_slaves" {
  description = "Max slaves"
  default     = "5"
}

// Nexus

variable "nexus_instance_type" {
  description = "Nexus instance type"
  default     = "t2.xlarge"
}