# resource "aws_security_group" "all_worker_magmt" {
#   name_prefix = "all_worker_management"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = module.vpc.vpc_id

# }

# resource "aws_vpc_security_group_ingress_rule" "all_worker_magmt_ingress" {
#   description = "allow inbound rule from eks"
#   security_group_id = aws_security_group.all_worker_magmt.id
#   cidr_ipv4         = var.vpc_cidr
#   from_port         = 0
#   ip_protocol       = "-1"
#   to_port           = 0
# }

# resource "aws_vpc_security_group_egress_rule" "all_worker_magmt_egress" {
#   description = "allow outbound traffic from anywhere"
#   security_group_id = aws_security_group.all_worker_magmt.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port = 0
#   ip_protocol       = "-1" # semantically equivalent to all ports
#   to_port = 0
# }



resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
  description       = "allow inbound traffic from eks"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "ingress"
  cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {
  description       = "allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.all_worker_mgmt.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}