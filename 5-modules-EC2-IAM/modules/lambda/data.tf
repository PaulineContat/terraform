data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "sns_publish_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sns:Publish"
    ]
    resources = [
      "arn:aws:sns:*:*:creation_ec2_topic"
    ]
  }
}

data "aws_caller_identity" "current" {}