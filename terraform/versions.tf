terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "rds-deploy-tf-state-225749317825"
    key    = "rds-deploy/terraform.tfstate"
    region = "us-east-1"
  }
}
