# Create a EC2 Machine
resource "aws_instance" "tf-ec2" {
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.tf-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.tf-ssh-http-sg.id]
  tags = {
    "Name" = "Dev-Instance"
  }
}

# Static ip
# EIP may require IGW to exist prior to association. 
# Use depends_on to set an explicit dependency on the IGW.
resource "aws_eip" "tf-vpc-eip" {
  domain   = "vpc"
  instance = aws_instance.tf-ec2.id
  tags = {
    "Name" = "dev-vpc-eip"
  }
  depends_on = [ 
    aws_internet_gateway.tf-vpc-igw
   ]
}