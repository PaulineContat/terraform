  resource "aws_instance" "ec2_instance" {
    for_each = var.instances

    ami           = data.aws_ami.latest_amazon_linux.id
    instance_type = each.value.instance_type
    tags = {
      Name = each.value.name
    }
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    user_data = <<-EOF
                  #!/bin/bash
                  aws lambda invoke --function-name "${var.lambda_arn}" --payload '{}' /tmp/lambda_invoke_result.txt
                  aws cloudwatch put-metric-data --metric-name EC2Launches --namespace EC2Namespace --value 1 --unit Count
                  ${each.value.user_data}
                  EOF
  }

  resource "aws_cloudwatch_metric_alarm" "ec2_launches_alarm" {
    alarm_name                = "ec2-many-launches"
    comparison_operator       = "GreaterThanThreshold"
    evaluation_periods        = 1
    metric_name               = "EC2Launches"
    namespace                 = "EC2Namespace"
    period                    = 60
    statistic                 = "Sum"
    threshold                 = 1
    alarm_description         = "This alarm fires if more than one EC2 instance is launched in 30 seconds"
    actions_enabled           = true
    alarm_actions             = [var.sns_topic_arn]
    # datapoints_to_alarm       = 2
  }

  resource "aws_iam_role_policy_attachment" "assume_role" {
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
    role       = aws_iam_role.lambda.name
  }
  
  resource "aws_iam_role" "lambda" {
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
    name               = "LabInstanceProfile"
  }
  
  resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.lambda.name
}
