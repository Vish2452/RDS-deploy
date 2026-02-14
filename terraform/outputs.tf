output "rds_endpoint" {
  description = "RDS instance endpoint (host:port)"
  value       = aws_db_instance.this.endpoint
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.this.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.this.port
}

output "rds_db_name" {
  description = "Name of the default database"
  value       = aws_db_instance.this.db_name
}

output "rds_username" {
  description = "Master username"
  value       = aws_db_instance.this.username
  sensitive   = true
}

output "rds_resource_id" {
  description = "RDS resource ID (used for IAM auth token generation)"
  value       = aws_db_instance.this.resource_id
}

output "rds_arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.this.arn
}

output "rds_security_group_id" {
  description = "Security group ID attached to the RDS instance"
  value       = aws_security_group.rds.id
}

output "rds_iam_auth_policy_arn" {
  description = "ARN of the IAM policy for RDS IAM authentication"
  value       = aws_iam_policy.rds_iam_auth.arn
}
