variable "vpc_remote_state_bucket" {
  description = "The name of the S3 bucket for the vpc's remote state"
  type = string
  default = "jimmyhaugh-jenkins-terraform-state"
}

variable "vpc_remote_state_key" {
  description = "The path of the the vpc's remote state"
  type = string
  default = "terraform/vpc/terraform.tfstate"
}

// Global variables

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

variable "jenkins_username" {
  description = "Jenkins username"
  default = "admin"
}

variable "jenkins_password" {
  description = "Jenkins password"
  default = "Lemons"
}

variable "jenkins_credentials_id" {
  description = "Slaves SSH ID"
  default = "Lemons"
}

// Default variables

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "SSH KeyPair"
  default = "ryzen_ireland_pair"
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
  default     = "1"
}

variable "max_jenkins_slaves" {
  description = "Max slaves"
  default     = "2"
}
