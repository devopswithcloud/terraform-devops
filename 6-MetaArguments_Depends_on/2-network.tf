# Create a VPC
# Create a Subnet
# Create a IGW 
# Create a Routing table 
# Create a route 
# Create a Security Group 
# Create a vm 
###***** Create a static ip>>>> fail
# Assign static ip to vm

# Create a VPC
resource "aws_vpc" "tf-vpc" {
  # pass arguments 
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "dev-vpc"
  }
}

# Create a subnet resource
resource "aws_subnet" "tf-dev-public-subnet-1" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "dev-public-subnet-1"
  }
}

# Create a IGW
resource "aws_internet_gateway" "tf-vpc-igw" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
    "Name" = "dev-vpc-igw"
  }

  # Delay Creation with null_resource
  depends_on = [ null_resource.igw_delay ]
}

# Null Resource to simulate Deplay 
resource "null_resource" "igw_delay" {
  provisioner "local-exec" {
    command = "echo 'Simulating Delay...' && sleep 90"
  }
  triggers = {
    # This ensures the null resource is triggered only once during the initial apply 
    "igw_creation_delay" = "true"
  }
}

# Create a Route table
resource "aws_route_table" "tf-vpc-public-route-table" {
  vpc_id = aws_vpc.tf-vpc.id
}

# Create a route in routing table for interet access
resource "aws_route" "tf-vpc-public-route" {
  route_table_id = aws_route_table.tf-vpc-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.tf-vpc-igw.id
}

# Associate route table with subnet 
resource "aws_route_table_association" "tf-vpc-public-route-table-association" {
  route_table_id = aws_route_table.tf-vpc-public-route-table.id
  subnet_id = aws_subnet.tf-dev-public-subnet-1.id
}

# Create a Security Group 
resource "aws_security_group" "tf-ssh-http-sg" {
  name = "dev-vpc-sg"
  description = "Allow HTTP and SSH Traffic from internet"
  vpc_id = aws_vpc.tf-vpc.id
  ingress  {
    description = "Allow HTTP From Intenet"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress  {
    description = "Allow SSH From Intenet"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress  {
    description = "Allow all ip ports outbount"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}