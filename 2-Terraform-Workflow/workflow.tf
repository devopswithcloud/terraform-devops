# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "your-access-key"
  secret_key = "your-secret-key"
}

# Create an EC2 machine
resource "aws_instance" "name" {
  ami           = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
}
