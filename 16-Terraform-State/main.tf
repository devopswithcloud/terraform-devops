// resource implementation

resource "aws_instance" "tf-my-ec2" {
  // arguments
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  tags = {
    "Name" = "WebServer"
  }
}


# Second VM
resource "aws_instance" "tf-my-ec2-new" {
  // arguments
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  tags = {
    "Name" = "AppServer"
  }
}
