provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "import_bucket" {
  bucket = "i27-demo-import-bucket"
}