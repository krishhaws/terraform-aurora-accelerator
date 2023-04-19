output "cluster_identifier" {
 # value       = local.is_regional_cluster ? join("", aws_rds_cluster.primary.*.cluster_identifier) : join("", aws_rds_cluster.secondary.*.cluster_identifier)
  value = aws_rds_cluster.standalone.cluster_identifier
  description = "Cluster Identifier"
}


