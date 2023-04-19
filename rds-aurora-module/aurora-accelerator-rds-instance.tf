resource "aws_rds_cluster_instance" "default" {
  count                                = "${var.readreplica + 1}"
  identifier                           = var.cluster_identifier == "" ? "${count.index + 1}" : "${var.cluster_identifier}-${count.index + 1}"
  cluster_identifier                   = coalesce(join("", aws_rds_cluster.standalone.*.id))
  instance_class                       = var.db_cluster_instance_class[var.size]
  db_parameter_group_name              = join("", aws_db_parameter_group.default.*.name)
  publicly_accessible                  = false
  engine                               = var.engine
  engine_version                       = var.engine_version
  auto_minor_version_upgrade           = var.auto_minor_version_upgrade
  monitoring_interval                  = var.rds_monitoring_interval
  monitoring_role_arn                  = var.enhanced_monitoring_role_enabled ? join("", aws_iam_role.enhanced_monitoring.*.arn) : var.rds_monitoring_role_arn
  performance_insights_enabled         = var.performance_insights_enabled
  apply_immediately                    = var.apply_immediately
  preferred_maintenance_window         = var.maintenance_window
  copy_tags_to_snapshot                = var.copy_tags_to_snapshot
  depends_on                           = [ aws_db_parameter_group.default, aws_rds_cluster_parameter_group.default,]
  lifecycle {
    ignore_changes = [engine_version]
  }
}

