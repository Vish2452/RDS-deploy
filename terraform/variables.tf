# -----------------------------------------------------------------------------
# General
# -----------------------------------------------------------------------------
variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "rds-deploy"
}

variable "environment" {
  description = "Environment tag (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# -----------------------------------------------------------------------------
# Networking – reuse EC2 runner VPC / SG
# -----------------------------------------------------------------------------
variable "vpc_id" {
  description = "VPC ID where the self-hosted runners live"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID of the self-hosted runners"
  type        = string
}

# -----------------------------------------------------------------------------
# RDS Configuration
# -----------------------------------------------------------------------------
variable "db_engine" {
  description = "Database engine (mysql or postgres)"
  type        = string
  default     = "postgres"

  validation {
    condition     = contains(["mysql", "postgres"], var.db_engine)
    error_message = "db_engine must be mysql or postgres."
  }
}

variable "db_engine_version" {
  description = "Engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Storage in GB"
  type        = number
  default     = 20
}

variable "db_max_allocated_storage" {
  description = "Max storage for autoscaling (GB). Set to 0 to disable."
  type        = number
  default     = 100
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Master password for the RDS instance (use secrets in CI)"
  type        = string
  sensitive   = true
}

variable "db_multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "db_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "db_deletion_protection" {
  description = "Prevent accidental deletion"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot on destroy"
  type        = bool
  default     = true
}

variable "db_backup_retention_period" {
  description = "Days to retain automated backups"
  type        = number
  default     = 7
}
