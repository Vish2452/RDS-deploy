# =============================================================================
# Data sources – look up existing VPC resources
# =============================================================================

data "aws_vpc" "runner" {
  id = var.vpc_id
}

# Grab all subnets in the VPC (needed for DB subnet group)
data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_security_group" "runner" {
  id = var.security_group_id
}

# Caller identity for IAM policy
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# =============================================================================
# DB Subnet Group – spans all subnets in the runner VPC
# =============================================================================

resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-${var.environment}-subnet-group"
  subnet_ids = data.aws_subnets.vpc_subnets.ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-subnet-group"
    Environment = var.environment
    Project     = var.project_name
  }
}

# =============================================================================
# Security Group Rule – allow inbound DB traffic from runner SG
# =============================================================================

locals {
  db_port = var.db_engine == "mysql" ? 3306 : 5432
}

resource "aws_security_group_rule" "rds_ingress_from_runner" {
  type                     = "ingress"
  from_port                = local.db_port
  to_port                  = local.db_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds.id
  source_security_group_id = var.security_group_id
  description              = "Allow DB access from self-hosted runner SG"
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}

# =============================================================================
# RDS Instance – IAM authentication enabled
# =============================================================================

resource "aws_db_instance" "this" {
  identifier     = "${var.project_name}-${var.environment}"
  engine         = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_allocated_storage > 0 ? var.db_max_allocated_storage : null

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  # Networking
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = var.db_publicly_accessible
  multi_az               = var.db_multi_az
  port                   = local.db_port

  # IAM Authentication
  iam_database_authentication_enabled = true

  # Backups & Maintenance
  backup_retention_period   = var.db_backup_retention_period
  deletion_protection       = var.db_deletion_protection
  skip_final_snapshot       = var.db_skip_final_snapshot
  final_snapshot_identifier = var.db_skip_final_snapshot ? null : "${var.project_name}-${var.environment}-final-snapshot"

  # Storage
  storage_encrypted = true
  storage_type      = "gp3"

  tags = {
    Name        = "${var.project_name}-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# =============================================================================
# IAM Policy – allows EC2 runner role to generate RDS auth tokens
# =============================================================================

resource "aws_iam_policy" "rds_iam_auth" {
  name        = "${var.project_name}-${var.environment}-rds-iam-auth"
  description = "Allow IAM authentication to RDS for the self-hosted runner"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "rds-db:connect"
        Resource = [
          "arn:aws:rds-db:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:dbuser:${aws_db_instance.this.resource_id}/${var.db_username}",
          "arn:aws:rds-db:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:dbuser:${aws_db_instance.this.resource_id}/cicd"
        ]
      }
    ]
  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# Attach the IAM auth policy to the GitHub Actions OIDC role
resource "aws_iam_role_policy_attachment" "rds_iam_auth" {
  role       = "GitHubActionsRole"
  policy_arn = aws_iam_policy.rds_iam_auth.arn
}
