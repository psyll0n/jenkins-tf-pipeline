variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
  description = "Public Subnet CIDR"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
  description = "Private Subnet CIDR"
}