resource "aws_s3_bucket" "tf-bucket" {
  for_each = {
    "dev" = "i27academy-b5"
    "qa" = "i27academy-b5"
    "prod" = "i27academy-b5"
  }
  bucket = "${each.key}-${each.value}" # dev-i27academy-b5
  tags = {
    "Environment" = each.key
  }
}

