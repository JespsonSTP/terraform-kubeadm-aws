terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "cheffapp-infrastructure"
    key    = "cheffapp-infrastructure/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "cheffapp-state-lock"
    encrypt        = true
  }
}