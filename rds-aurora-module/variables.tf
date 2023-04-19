variable "cluster_identifier" {
  type        = string
  default     = ""
  description = "The RDS Cluster Identifier. Will use generated label ID if not supplied"
}

variable "db_name" {
  type        = string
  default     = ""
  description = "Database name (default is not to create a database)"
}

variable "admin_user" {
  type        = string
  default     = "admin"
  description = "Username for the master DB user. Ignored if snapshot_identifier or replication_source_identifier is provided"
}

variable "admin_password" {
  type        = string
  default     = ""
  description = "Password for the master DB user. Ignored if snapshot_identifier or replication_source_identifier is provided"
}

variable "retention_period" {
  type        = number
  default     = 5
  description = "Number of days to retain backups for"
}

variable "backup_window" {
  type        = string
  default     = "07:00-09:00"
  description = "Daily time range during which the backups happen"
}

variable "maintenance_window" {
  type        = string
  default     = "wed:03:00-wed:04:00"
  description = "Weekly time range during which system maintenance can occur, in UTC"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  default     = true
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "Copy tags to backup snapshots"
  default     = false
}

variable "deletion_protection" {
  type        = bool
  description = "If the DB instance should have deletion protection enabled"
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
  default     = true
}

variable "db_cluster_instance_class" {
   type   = map
  default = {
     "large"    = "db.r5.large"
     "xlarge"  = "db.r6g.xlarge"
     "2xlarge"  = "db.r6g.2xlarge"
   }
}

variable "size" {
  description = "The size of the instances"
}

variable "storage_encrypted" {
  type        = bool
  default     = true
}

variable "storage_type" {
  type        = string
  default     = null
}

variable "iops" {
  type        = number
  default     = null
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in GBs"
  default     = null
}

variable "kms_key_arn" {
  type        = string
  default     = ""
}

variable "source_region" {
  type        = string
  description = "Source Region of primary cluster, needed when using encrypted storage and region replicas"
  default     = ""
}

variable "snapshot_identifier" {
  type        = string
  default     = null
  description = "Specifies whether or not to create this cluster from a snapshot"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default = []
}

variable "iam_database_authentication_enabled" {
  type        = bool
  default     = false
}

variable "engine" {
  type        = string
  default     = "aurora"
}

variable "engine_mode" {
  type        = string
  default     = "provisioned"
  description = "The database engine mode. Valid values: `parallelquery`, `provisioned`, `serverless`"
}

variable "engine_version" {
  type        = string
  default     = ""
  description = "The version of the database engine to use. See `aws rds describe-db-engine-versions` "
}

variable "allow_major_version_upgrade" {
  type        = bool
  default     = false
  description = "Enable to allow major engine version upgrades when changing engine versions. Defaults to false."
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = true
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
}

variable "iam_roles" {
  type        = list(string)
  description = "Iam roles for the Aurora cluster"
  default     = []
}

variable "backtrack_window" {
  type        = number
  description = "The target backtrack window, in seconds. Only available for aurora engine currently. Must be between 0 and 259200 (72 hours)"
  default     = 0
}

variable "enable_http_endpoint" {
  type        = bool
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to cloudwatch. The following log types are supported: audit, error, general, slowquery"
  default     = []
}

variable "replication_source_identifier" {
  type        = string
  default     = ""
}

variable "cluster_parameters" {
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
  default     = []
  description = "List of DB cluster parameters to apply"
}

variable "cluster_family" {
  type        = string
  description = "The family of the DB cluster parameter group"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Subnet group name"
}

variable "restore_to_point_in_time" {
  type = list(object({
    source_cluster_identifier  = string
    restore_type               = string
    use_latest_restorable_time = bool
  }))
  default     = []
}

variable "instance_parameters" {
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
  default     = []
  description = "List of DB instance parameters to apply"
}

variable "rds_monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when enhanced monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60"
  default     = 0
}

variable "rds_monitoring_role_arn" {
  type        = string
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
  default     = null
}

variable "enhanced_monitoring_role_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable the creation of the enhanced monitoring IAM role. If set to `false`, the module will not create a new role and will use `rds_monitoring_role_arn` for enhanced monitoring"
  default     = false
}

variable "performance_insights_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable Performance Insights"
}

variable "readreplica" {
   type = number
   default = 1
   description = "number of read replicas for the db cluster"
}

variable "vpc_id" {
  type        = string
  description = "Provide the existing VPC ID" 
  default = ""
}

variable "create_security_group" {
  type         = bool
  default      = true
  description  = "Whether to create security group"
}

variable "db_port" {
  type     = number
  default  = 5432
  description = "port number of RDS aurora instance"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "List of CIDR blocks allowed to access the cluster"
}

variable "create_subnet_group" {
  type      = bool
  default   = true
}

variable "subnets" {
  type   = list(string)
}
