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
  cidr_block = var.vpc_cidr_blocks
  tags = {
    "Name" = "${var.env_prefix}-vpc"
  }
}

# Create a subnet resource
resource "aws_subnet" "tf-dev-public-subnet-1" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = var.subnet_cidr_blocks
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${var.env_prefix}-public-subnet-1"
  }
}

# Create a IGW
resource "aws_internet_gateway" "tf-vpc-igw" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
    "Name" = "${var.env_prefix}-vpc-igw"
  }
}


# Create a Route table
resource "aws_route_table" "tf-vpc-public-route-table" {
  vpc_id = aws_vpc.tf-vpc.id
}

# Create a route in routing table for interet access
resource "aws_route" "tf-vpc-public-route" {
  route_table_id = aws_route_table.tf-vpc-public-route-table.id
  destination_cidr_block = var.public_ip
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