resource "aws_db_subnet_group" "aurora-accelerator" {
  count       = var.create_subnet_group ? 1 : 0
  name        = var.cluster_identifier
  description = "Allowed subnets for DB cluster instances"
  subnet_ids  = var.subnets
}
