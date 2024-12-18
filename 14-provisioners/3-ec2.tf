# variable "instance_type" {
#   default = "t2.micro"
# }

# variable "ami" {
#   default = "ami-012967cc5a8c9f891"
# }

# Create a key pair from local file
resource "aws_key_pair" "ssh-key" {
  key_name = "server-key"
  public_key = file("id_rsa.pub")
}


# Create a EC2 Machine
resource "aws_instance" "tf-ec2" {
  ami = "ami-012967cc5a8c9f891"
  key_name = aws_key_pair.ssh-key.key_name
  instance_type = "t2.micro"
  subnet_id = aws_subnet.tf-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.tf-ssh-http-sg.id]
  tags = {
    "Name" = "Dev-Instance"
  }

  connection {
    type = "ssh" # winrm
    host = self.public_ip
    user = "ec2-user"
    private_key = file("id_rsa")
  }

  # Provisioner Block
  provisioner "file" {
    source = "entry.sh"
    destination = "/home/ec2-user/entry-script.sh"
  }
  
  provisioner "remote-exec" {
    # will execute on the remote server
    #script = file("/home/ec2-user/entry-script.sh")
    inline = [ 
      "mkdir hellofolder",
      "sh entry-script.sh"
     ]
  }

  provisioner "local-exec" {
    # this invokes a local executable after the resource is created
    command = "echo ${self.public_ip} > sivapublicip.txt"
  }

}

