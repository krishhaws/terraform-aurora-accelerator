module "rds_cluster" {
  source = "./rds-aurora-complete"

  engine                           = var.engine
  cluster_identifier               = var.cluster_identifier
  engine_mode                      = var.engine_mode
  engine_version                   = var.engine_version
  cluster_family                   = var.cluster_family
  admin_user                       = var.admin_user
  db_name                          = var.db_name
  vpc_security_group_ids           = var.vpc_security_group_ids
  deletion_protection              = var.deletion_protection
  storage_type                     = var.storage_type
  iops                             = var.iops
  allocated_storage                = var.allocated_storage
  db_subnet_group_name             = var.db_subnet_group_name
  enhanced_monitoring_role_enabled = var.enhanced_monitoring_role_enabled
  rds_monitoring_interval          = var.rds_monitoring_interval
  performance_insights_enabled     = var.performance_insights_enabled
  readreplica                      = var.readreplica
  vpc_id                           = var.vpc_id
  create_security_group            = var.create_security_group
  allowed_cidr_blocks              = var.allowed_cidr_blocks
  create_subnet_group              = var.create_subnet_group
  subnets                          = var.subnets
  size                             = var.size
}
