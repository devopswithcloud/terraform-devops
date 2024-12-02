resource "aws_instance" "tf-ec2" {
  # Arguments
  count = 3
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  #availability_zone = "us-east-1a"
  tags = {
    #"Name" = "Web-Instance"
    "Name" = "WebServer-${count.index}"
  }
}