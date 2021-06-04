# Variables for VPC
######################################
variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_a" {
  default     = "10.0.1.0/24"
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr_a" {
  default     = "10.0.101.0/24"
  description = "Private Subnet CIDR"
}

variable "public_subnet_cidr_b" {
  default     = "10.0.2.0/24"
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr_b" {
  default     = "10.0.102.0/24"
  description = "Private Subnet CIDR"
}

variable "public_subnet_cidr_c" {
  default     = "10.0.3.0/24"
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr_c" {
  default     = "10.0.103.0/24"
  description = "Private Subnet CIDR"
}


# Variables for EC2 Instance
######################################

variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-043097594a7df80ec"
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
}

variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "aws-ssh-keypair"
}

variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}

variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "8"
}

