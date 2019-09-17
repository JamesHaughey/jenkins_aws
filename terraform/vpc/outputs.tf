output "VPC_ID" {
  value = "${aws_vpc.default.id}"
}

output "Public_Subnets" {
  value = "${aws_subnet.public_subnets.*.id}"
}

output "Private_Subnets" {
  value = "${aws_subnet.private_subnets.*.id}"
}

output "Bastion_SG_ID" {
  value = "${aws_security_group.bastion_host.id}"
}
