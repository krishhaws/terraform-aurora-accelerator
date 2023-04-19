variable "region" {
  type        = string
  description = "AWS region"
}

variable "availability_zones" {
  type = list(string)
}

variable "cluster_size" {
  type        = number
  description = "Number of DB instances to create in the cluster"
  default = 1
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "admin_user" {
  type        = string
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
}

variable "admin_password" {
  type        = string
  description = "(Required unless a snapshot_identifier is provided) Password for the master DB user"
  default = "password"
}

variable "master_password" {
  type        = string
  description = "(Required unless a snapshot_identifier is provided) Password for the master DB user"
  default = "password"
}

variable "cluster_family" {
  type        = string
  description = "The family of the DB cluster parameter group"
}

variable "engine" {
  type        = string
  description = "The name of the database engine to be used for this DB cluster. Valid defaults: `aurora`, `aurora-mysql`, `aurora-postgresql`"
}

variable "engine_mode" {
  type        = string
  description = "The database engine mode. Valid defaults: `parallelquery`, `provisioned`, `serverless`"
  default     = "provisioned"
}

variable "deletion_protection" {
  type        = bool
  description = "If the DB instance should have deletion protection enabled"
  default     = "false"
}

variable "autoscaling_enabled" {
  type        = bool
  description = "Whether to enable cluster autoscaling"
  default     = "false"
}

variable "enhanced_monitoring_role_enabled" {
  type        = bool
  default     = "false"
}

variable "rds_monitoring_interval" {
  type        = number
  default     = 0
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

variable "intra_security_group_traffic_enabled" {
  type        = bool
  default     = false
  description = "Whether to allow traffic between resources inside the database's security group."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  default = []
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

variable "engine_version" {
  type        = string
  default     = ""
}

variable "db_subnet_group_name" {
  type = string
}

variable "cluster_identifier" {
  type        = string
  default     = ""
  description = "The RDS Cluster Identifier. Will use generated label ID if not supplied"
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
