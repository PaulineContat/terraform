resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
  iam_instance_profile = var.aws_iam_role_name
  user_data = <<-EOF
                  #!/bin/bash
                  aws lambda invoke --function-name "${var.lambda_arn}" --payload '{}' /tmp/lambda_invoke_result.txt
              EOF
}