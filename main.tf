variable "sg_ids" {}
variable "db_clusterid" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.db_clusterid
  engine                  = "aurora-postgresql"  
  engine_mode             = "serverless"
  availability_zones      = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  vpc_security_group_ids  = var.sg_ids
  database_name           = var.db_name #alphanumeric
  enable_http_endpoint    = true  
  master_username         = var.db_username
  master_password         = var.db_password
  backup_retention_period = 1
  skip_final_snapshot     = true
  
  scaling_configuration {
    auto_pause               = true
    min_capacity             = 2    
    max_capacity             = 2
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }  
}
