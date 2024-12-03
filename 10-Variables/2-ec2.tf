#***************************************************************

resource "aws_instance" "tf-ec2" {
  # Arguments
  count = var.instance_count
  ami = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  #availability_zone = "us-east-1a"
  tags = {
    #"Name" = "Web-Instance"
    "Name" = "WebServer-${count.index}"
  }
}