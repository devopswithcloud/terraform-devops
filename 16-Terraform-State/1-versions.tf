# Terraform Block
terraform {
  required_version = "~>1.9.3"

  required_providers {
    aws = { # local name
      version = "~> 5.76.0"
      source = "hashicorp/aws"
    }
  }

  # backend 
  backend "s3" {
    bucket = "i27academy-tf-devopsb5"
    key = "data/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-i27-table"

    # for state locking
    # dynamodb_table = "value"
  }
}


# Provider Block  for us-east-1 , this will be the default provider
provider "aws" {
  region = "us-east-1"
}


