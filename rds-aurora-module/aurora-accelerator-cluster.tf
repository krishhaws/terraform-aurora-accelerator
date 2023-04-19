resource "aws_rds_cluster" "standalone" {
  cluster_identifier                  = var.cluster_identifier
  database_name                       = var.db_name
  master_username                     = local.db_creds.username
  master_password                     = local.db_creds.password
  backup_retention_period             = var.retention_period
  preferred_backup_window             = var.backup_window
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  skip_final_snapshot                 = var.skip_final_snapshot
  apply_immediately                   = var.apply_immediately
  storage_encrypted                   = var.storage_encrypted
  storage_type                        = var.storage_type
  iops                                = var.iops
  allocated_storage                   = var.allocated_storage
  kms_key_id                          = var.kms_key_arn
  source_region                       = var.source_region
  snapshot_identifier                 = var.snapshot_identifier
  #vpc_security_group_ids              = join("",aws_security_group.aurora-accelerator-sg.*.id)
  vpc_security_group_ids              = var.create_security_group ? [join("", aws_security_group.aurora-accelerator-sg.*.id)] : var.vpc_security_group_ids
  preferred_maintenance_window        = var.maintenance_window
  #db_subnet_group_name                = var.db_subnet_group_name
  db_subnet_group_name                = join("", aws_db_subnet_group.aurora-accelerator.*.name)
  db_cluster_parameter_group_name     = join("", aws_rds_cluster_parameter_group.default.*.name)
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  engine                              = var.engine
  engine_version                      = var.engine_version
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  engine_mode                         = var.engine_mode
  iam_roles                           = var.iam_roles
  backtrack_window                    = var.backtrack_window
  depends_on                          = [ aws_rds_cluster_parameter_group.default, ]
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  deletion_protection                 = var.deletion_protection
  replication_source_identifier       = var.replication_source_identifier
}


