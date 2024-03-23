resource "aws_lambda_function" "lambda_function" {
  filename         = "lambda_function_payload.zip"
  function_name    = var.lambda_function_name
  description      = var.lambda_description
  role             = aws_iam_role.iam_for_lambda_with_sns.arn
  handler          = var.lambda_function_name + ".handler"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime          = var.lambda_runtime
}

resource "aws_iam_role" "iam_for_lambda_with_sns" {
  name               = "lambda-${lower(var.lambda_function_name)}-creation_ec2_topic"
  assume_role_policy = data.aws_iam_policy_document.lambda_sns_publish_policy.json
}

# # JSON POLICY - add SNS publish permission
data "aws_iam_policy_document" "lambda_sns_publish_policy" {
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

# resource "aws_iam_policy" "lambda_sns_publish" {
#   name        = "lambda_sns_publish_policy"
#   description = "IAM policy for Lambda to publish SNS messages"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action   = "sns:Publish",
#         Resource = aws_sns_topic.creation_ec2_topic.arn,
#         Effect   = "Allow",
#       },
#     ],
#   })
# }

# resource "aws_iam_role_policy_attachment" "lambda_sns_publish_attachment" {
#   role       = aws_iam_role.iam_for_lambda_with_sns.name
#   policy_arn = aws_iam_policy.lambda_sns_publish.arn
# }

# # Apply the combined policy to the Lambda role
# resource "aws_iam_policy" "lambda_execution_policy" {
#   name   = "lambda_execution_policy-${var.lambda_function_name}-${var.sns_topic_name}"
#   policy = data.aws_iam_policy_document.lambda_sns_publish_policy.json
# }

# resource "aws_iam_role_policy_attachment" "lambda_execution_policy_attach" {
#   role       = aws_iam_role.iam_for_lambda_with_sns.id
#   policy_arn = aws_iam_policy.lambda_execution_policy.arn
# }

# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "PublishSNSMessage",
#       "Effect": "Allow",
#       "Action": "sns:Publish",
#       "Resource": "arn:aws:sns:<your-region>:<your-account-number>:<your-topic-name>"
#     }
#   ]
# }

# resource "aws_lambda_permission" "sns_invoke" {
#   statement_id  = "AllowExecutionFromSNS"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.lambda_function.function_name
#   principal     = "sns.amazonaws.com"
#   source_arn    = aws_sns_topic.sns_topic.arn
# }