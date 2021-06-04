variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_a" {
  default = "10.0.1.0/24"
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr_a" {
  default = "10.0.101.0/24"
  description = "Private Subnet CIDR"
}

variable "public_subnet_cidr_b" {
  default = "10.0.2.0/24"
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr_b" {
  default = "10.0.102.0/24"
  description = "Private Subnet CIDR"
}

variable "public_subnet_cidr_c" {
  default = "10.0.3.0/24"
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr_c" {
  default = "10.0.103.0/24"
  description = "Private Subnet CIDR"
}


