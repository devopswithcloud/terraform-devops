# Create a VPC 
# Create a VPC
resource "aws_vpc" "myapp-vpc" {
  # pass arguments 
  cidr_block = var.vpc_cidr_blocks
  tags = {
    "Name" = "${var.env_prefix}-vpc"
  }
}


# Calling subnet module 
module "myapp-subnet" {
  source = "./modules/subnet"

  # the below are the variables which are defined in subnet module
  vpc_id = aws_vpc.myapp-vpc.id
  subnet_cidr_blocks = var.subnet_cidr_blocks
  availability_zone = var.availability_zone
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
  public_ip = var.public_ip 
  env_prefix = var.env_prefix
}


# Calling Webserver Module
module "myapp-webserver" {
  source = "./modules/webserver"
  vpc_id = aws_vpc.myapp-vpc.id
  instance_type = var.instance_type
  # the below subnet_id is coming from subnet module output
  subnet_id = module.myapp-subnet.subnet.id
  public_key_data = var.public_key_data
  public_ip = var.public_ip
}





