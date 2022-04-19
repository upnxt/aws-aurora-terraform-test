resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"  
  engine_mode             = "serverless"  
  database_name           = "myauroradb"  
  enable_http_endpoint    = true  
  master_username         = "sa"
  master_password         = "232-3sdcrb34gh134rrtn6uk89k78j5h"
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
