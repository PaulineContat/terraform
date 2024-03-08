resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.linux.id
  instance_name = var.instance_name
  instance_type = var.instance_type
  instance_role = data.aws_iam_role.lab_role.name
}