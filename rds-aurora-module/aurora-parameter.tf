resource "aws_rds_cluster_parameter_group" "default" {
  name_prefix = var.cluster_identifier
  description = "DB cluster parameter group"
  family      = var.cluster_family
  dynamic "parameter" {
    for_each = var.cluster_parameters
    content {
      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_db_parameter_group" "default" {
  name_prefix = var.cluster_identifier
  description = "DB instance parameter group"
  family      = var.cluster_family
  dynamic "parameter" {
    for_each = var.instance_parameters
    content {
      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}
