
locals {
  #bucket_name = appame +environemtn-bucket-b5
    bucket_name = "${var.app_name}-${var.environment}-bucket-b5" # boutique-dev-bucket-b5
}

resource "aws_s3_bucket" "mys3bucket" {
  # should be unique across globe 
  bucket = local.bucket_name
  tags = {
    "Environment" = var.environment
    "Application" = var.app_name
  }
}

variable "app_name" {
  type = string
  default = "boutique"
}

variable "environment" {
  type = string
  default = "dev"
  
}

