
# Create a Security Group 
resource "aws_security_group" "tf-ssh-http-sg" {
  name = "dev-vpc-sg"
  description = "Allow HTTP and SSH Traffic from internet"
  vpc_id = var.vpc_id
  ingress  {
    description = "Allow HTTP From Intenet"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.public_ip]
  }
  ingress  {
    description = "Allow SSH From Intenet"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.public_ip]
    }

    # allow 8080
    ingress  {
    description = "Allow 8080 From Intenet"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [var.public_ip]
    }

  egress  {
    description = "Allow all ip ports outbount"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.public_ip]
  }
}

# Create a key pair from local file
resource "aws_key_pair" "ssh-key" {
  key_name = "server-key"
  public_key = var.public_key_data
}


# Create a EC2 Machine
resource "aws_instance" "tf-ec2" {
  ami = "ami-012967cc5a8c9f891"
  key_name = aws_key_pair.ssh-key.key_name
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.tf-ssh-http-sg.id]
  tags = {
    "Name" = "Dev-Instance"
  }
}
