resource "aws_security_group" "jenkins_master_sg" {
  name        = "jenkins_master_sg"
  description = "Allow traffic on port 8080 and enable SSH"
  vpc_id      = "${data.terraform_remote_state.vpc.outputs.VPC_ID}"

  ingress {
    from_port       = "22"
    to_port         = "22"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.vpc.outputs.Bastion_SG_ID}"]
  }

  ingress {
    from_port       = "8080"
    to_port         = "8080"
    protocol        = "tcp"
    cidr_blocks     = ["${var.vpc_cidr_block}"]
    security_groups = ["${aws_security_group.elb_jenkins_sg.id}"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "jenkins_master_sg"
    Author = "nexus-user-conference"
    Tool   = "Terraform"
  }
}

resource "aws_security_group" "jenkins_slaves_sg" {
  name        = "jenkins_slaves_sg"
  description = "Allow traffic on port 22 from Jenkins Master SG"
  vpc_id      = "${data.terraform_remote_state.vpc.outputs.VPC_ID}"

  ingress {
    from_port       = "22"
    to_port         = "22"
    protocol        = "tcp"
    security_groups = ["${aws_security_group.jenkins_master_sg.id}", "${data.terraform_remote_state.vpc.outputs.Bastion_SG_ID}"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "jenkins_slaves_sg"
    Author = "nexus-user-conference"
    Tool   = "Terraform"
  }
}

resource "aws_security_group" "elb_jenkins_sg" {
  name        = "elb_jenkins_sg"
  description = "Allow https traffic"
  vpc_id      = "${data.terraform_remote_state.vpc.outputs.VPC_ID}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "elb_jenkins_sg"
    Author = "nexus-user-conference"
    Tool   = "Terraform"
  }
}
