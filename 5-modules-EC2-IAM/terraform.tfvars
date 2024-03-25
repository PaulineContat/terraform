instances = {
  "ec2_instance_1" = {
    name          = "1-ec2-instance"
    instance_type = "t2.micro"
    user_data     = "echo Yeeeha"
  },
  "ec2_instance_2" = {
    name          = "2-ec2-instance"
    instance_type = "t2.micro"
    user_data     = ""
  },
  "ec2_instance_3" = {
    name          = "3-ec2-instance"
    instance_type = "t2.micro"
    user_data     = ""
    instance_role = data.assume_role
  },
  "ec2_instance_4" = {
    name          = "4-ec2-instance"
    instance_type = "t2.micro"
    user_data     = ""
  "ec2_instance_5" = {
    name          = "5-ec2-instance"
    instance_type = "t2.micro"
    user_data     = ""
  }
}
