output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.this.*.id
}


output "security_groups" {
  description = "List of associated security groups of instances"
  value       = aws_instance.this.*.security_groups
}


output "vpc_security_group_ids" {
  description = "List of associated security groups of instances, if running in non-default VPC"
  value       = aws_instance.this.*.vpc_security_group_ids
}