output "instance_id" {
  description = "instance id"
  value = values(aws_instance.ec2_instance).*.id
}