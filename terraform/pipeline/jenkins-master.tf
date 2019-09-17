resource "aws_instance" "jenkins_master" {
  ami                    = "${data.aws_ami.jenkins-master.id}"
  instance_type          = "${var.jenkins_master_instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.jenkins_master_sg.id}"]
  subnet_id              = "${element(data.terraform_remote_state.vpc.outputs.Private_Subnets, 0)}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = false
  }

  tags = {
    Name   = "jenkins_master"
    Author = "nexus-user-conference"
    Tool   = "Terraform"
  }
}
