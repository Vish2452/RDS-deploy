# =============================================================================
# Terraform variable values – adjust to your environment
# =============================================================================

aws_region = "us-east-1"

# Project
project_name = "rds-deploy"
environment  = "dev"

# Networking – self-hosted runner VPC & SG
vpc_id            = "vpc-0c185a3e6c0239bc2"
security_group_id = "sg-04381b9eaa5f7441d"

# RDS
db_engine            = "postgres"
db_engine_version    = "16.4"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "appdb"
db_username          = "dbadmin"
# db_password is intentionally omitted – pass via TF_VAR_db_password or GitHub secret

db_multi_az            = false
db_publicly_accessible = false
db_deletion_protection = false
db_skip_final_snapshot = true
