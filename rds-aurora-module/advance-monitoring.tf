resource "aws_iam_role" "enhanced_monitoring" {
  count              = var.enhanced_monitoring_role_enabled ? 1 : 0
  name               = "${var.cluster_identifier}-monitoring-iam"
  assume_role_policy = join("", data.aws_iam_policy_document.enhanced_monitoring.*.json)
}

resource "aws_iam_role_policy_attachment" "enhanced_monitoring" {
  count      = var.enhanced_monitoring_role_enabled ? 1 : 0
  role       = join("", aws_iam_role.enhanced_monitoring.*.name)
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

data "aws_iam_policy_document" "enhanced_monitoring" {
  count = var.enhanced_monitoring_role_enabled ? 1 : 0

  statement {
    actions = [
      "sts:AssumeRole"
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}
