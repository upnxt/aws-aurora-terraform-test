variable "db_clusterid" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.db_clusterid
  engine                  = "aurora-postgresql"  
  engine_mode             = "serverless"  
  database_name           = var.db_name
  enable_http_endpoint    = true  
  master_username         = var.db_username
  master_password         = var.db_password
  backup_retention_period = 1
  skip_final_snapshot     = true
  
  scaling_configuration {
    auto_pause               = true
    min_capacity             = 1    
    max_capacity             = 1
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }  
}
