# Create a Subnet 
resource "aws_subnet" "myapp-subnet-1" {
  vpc_id = var.vpc_id
  cidr_block = var.subnet_cidr_blocks
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${var.env_prefix}-subnet-1"
  }
}


# Create a IGW
resource "aws_internet_gateway" "tf-vpc-igw" {
  vpc_id = var.vpc_id
  tags = {
    "Name" = "${var.env_prefix}-vpc-igw"
  }
}


# Create a default route table
resource "aws_default_route_table" "myapp-main-rtb" {
  default_route_table_id = var.default_route_table_id
  route  {
    cidr_block = var.public_ip
    gateway_id = aws_internet_gateway.tf-vpc-igw.id
  }
  tags = {
    "Name" = "${var.env_prefix}-main.rtb"
  }
}