# Create 4 users 
resource "aws_iam_user" "tf-user" {
  for_each = toset(["siva", "mahesh"])
  name = each.key
  # name = each.value
}


