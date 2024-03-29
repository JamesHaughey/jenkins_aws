terraform {
  backend "s3" {
    bucket = "jimmyhaugh-jenkins-terraform-state"
    key = "terraform/pipeline/terraform.tfstate"
    region = "eu-west-1"

    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}

provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.aws_profile}"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.vpc_remote_state_bucket
    key = var.vpc_remote_state_key
    region = "eu-west-1"
  }
}