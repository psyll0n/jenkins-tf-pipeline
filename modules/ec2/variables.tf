 
variable "instance_ami" {
  description = "ID of the AMI used"
}
 
variable "instance_type" {
  description = "Type of the instance"
}
 
variable "key_pair" {
  description = "SSH Key pair used to connect"
}
 
variable "root_device_type" {
  description = "Type of the root block device"
}
 
variable "root_device_size" {
  description = "Size of the root block device"
}

variable "subnet_id" {
    description = "Subnet where the EC2 instance is deployed"
}