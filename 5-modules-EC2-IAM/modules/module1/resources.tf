resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type
  instance_role = data.aws_iam_role.lab_role.name
  tags = {
    Name = var.instance_name
  }
  iam_instance_profile = data.aws_iam_role.lab_role.name
}