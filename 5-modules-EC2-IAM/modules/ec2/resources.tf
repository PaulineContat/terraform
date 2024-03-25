  resource "aws_instance" "ec2_instance" {
    for_each = var.instances

    ami           = data.aws_ami.latest_amazon_linux.id
    instance_type = each.value.instance_type
    tags = {
      Name = each.value.name
    }
    iam_instance_profile = each.value.instance_role
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