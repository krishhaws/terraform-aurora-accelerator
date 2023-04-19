
## Aurora RDS details
engine                           = "aurora-postgresql"
engine_version                   = "14.6"
cluster_family                   = "aurora-postgresql14"
admin_user                       = "admin1"
db_name                          = "dbname"
db_port                          = 5432
size                             = "large" # Accepted values large (db.r6g.large), xlarge, 2xlarge
vpc_id                           = "vpc-0adedb53ef8a8979c"
region                           = "us-east-1"
availability_zones               = ["us-east-1a", "us-east-1c"]
db_subnet_group_name             = "test-aurora-postgresql-db-7zdbl-k8pcs"
subnets                          = ["subnet-0d3585c9241afdcc2","subnet-053daa5daf6db5263"]
cluster_identifier               = "test-terraform-rds"

## Customized boolean options
enhanced_monitoring_role_enabled = false
rds_monitoring_interval          = 0
performance_insights_enabled     = true
readreplica                      = 0
create_security_group            = true
allowed_cidr_blocks              = []
create_subnet_group              = true
