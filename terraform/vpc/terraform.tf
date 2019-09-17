terraform {
  backend "s3" {
    bucket = "jimmyhaugh-jenkins-terraform-state"
    key = "terraform/vpc/terraform.tfstate"
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
