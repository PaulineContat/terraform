data "aws_ami" "linux" {
  most_recent = true
}

data "aws_iam_role" "lab_role" {
  name = "LabInstanceProfile"
}