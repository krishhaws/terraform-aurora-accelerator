resource "aws_security_group" "aurora-accelerator-sg" {
  count       = var.create_security_group ? 1 : 0
  name        = "rds-accelerator"
  description = "Allow inbound traffic from Security Groups and CIDRs"
  vpc_id      = var.vpc_id
}
 
resource "aws_security_group_rule" "ingress_security_groups" {
  count                    = length(var.vpc_security_group_ids) > 0 ? length(var.vpc_security_group_ids) : 0
  description              = "Allow inbound traffic from existing security groups"
  type                     = "ingress"
  from_port                = var.db_port
  to_port                  = var.db_port
  protocol                 = "tcp"
  source_security_group_id = var.vpc_security_group_ids[count.index]
  security_group_id        = join("", aws_security_group.aurora-accelerator-sg.*.id)
}

resource "aws_security_group_rule" "traffic_inside_security_group" {
  count             = var.create_security_group ? 1 : 0
  description       = "Allow traffic between members of the database security group"
  type              = "ingress"
  from_port         = var.db_port
  to_port           = var.db_port
  protocol          = "tcp"
  self              = true
  security_group_id = join("", aws_security_group.aurora-accelerator-sg.*.id)
}

resource "aws_security_group_rule" "ingress_cidr_blocks" {
  count             = length(var.allowed_cidr_blocks) > 0 ? 1 : 0
  description       = "Allow inbound traffic from existing CIDR blocks"
  type              = "ingress"
  from_port         = var.db_port
  to_port           = var.db_port
  protocol          = "tcp"
  prefix_list_ids   = []
  cidr_blocks       = var.allowed_cidr_blocks
  security_group_id = join("", aws_security_group.aurora-accelerator-sg.*.id)
}

resource "aws_security_group_rule" "egress" {
  description       = "Allow outbound traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = join("", aws_security_group.aurora-accelerator-sg.*.id)
}

