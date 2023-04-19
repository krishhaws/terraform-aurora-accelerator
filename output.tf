output "cluster_identifier" {
  value       = module.rds_cluster.cluster_identifier
  description = "Cluster Identifier"
}

#output "endpoint" {
#  value       = module.rds_cluster.endpoint
#  description = "The DNS address of the RDS instance"
#}


