output "instance_id" {
  description = "instance id"
  value = { for key, instance in aws_instance.ec2_instance : key => instance.id }
}