
# Variables for EC2 Instance
######################################

variable "key_name" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "aws-ssh-keypair"
}

