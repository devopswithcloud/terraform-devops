variable "vpc_cidr_blocks" {}

# the below variables are actualy defined in subnet module
variable "subnet_cidr_blocks" {}
variable "availability_zone" {}
variable "public_ip" {}
variable "env_prefix" {}


# the below variables are defined in webserver module
variable "instance_type" {}

variable "public_key_data" {}