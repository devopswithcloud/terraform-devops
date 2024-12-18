# Terraform Block
terraform {
  required_version = "~>1.9.3"

  required_providers {
    aws = { # local name
      version = "~> 5.76.0"
      source = "hashicorp/aws"
    }
  }
}


# Provider Block 
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAXNGUVK42AIMUWFV6" 
  secret_key = "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"
}