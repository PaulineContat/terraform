instances = {
  "ec2_instance_1" = {
    name          = "1-ec2-instance"
    instance_type = "t2.micro"
    user_data     = "echo Yeeeha"
    instance_role = "LabInstanceProfile"
  },
  "ec2_instance_2" = {
    name          = "2-ec2-instance"
    instance_type = "t2.micro"
    user_data     = ""
    instance_role = "LabInstanceProfile"
  }
}
