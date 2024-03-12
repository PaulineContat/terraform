resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
  iam_instance_profile = var.aws_iam_role_name
}