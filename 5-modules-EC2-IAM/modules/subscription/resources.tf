resource "aws_sns_topic" "creation_ec2_topic" {
  name = "ec2-creation-topic"
}

resource "aws_sns_topic_subscription" "creation_ec2_subscription" {
  topic_arn = aws_sns_topic.creation_ec2_topic.arn
  protocol  = "email"
  endpoint  = var.email
}

# // lambda part

# module "lambda_function" {
#   source = "terraform-aws-modules/lambda/aws"

#   function_name = "my-lambda1"
#   description   = "My awesome lambda function"
#   handler       = "index.lambda_handler"
#   runtime       = "python3.8"

#   source_path = "../src/lambda-function1"

#   tags = {
#     Name = "my-lambda1"
#   }
# }

# resource "aws_lambda_invocation" "example" {
#   function_name = aws_lambda_function.lambda_function_test.function_name

#   input = jsonencode({
#     key1 = "value1"
#     key2 = "value2"
#   })
# }

# output "result_entry" {
#   value = jsondecode(aws_lambda_invocation.example.result)["key1"]
# }

# // lambda part 2


# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["lambda.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "iam_for_lambda" {
#   name               = "iam_for_lambda"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }

# data "archive_file" "lambda" {
#   type        = "zip"
#   source_file = "lambda.js"
#   output_path = "lambda_function_payload.zip"
# }

# resource "aws_lambda_function" "test_lambda" {
#   # If the file is not in the current working directory you will need to include a
#   # path.module in the filename.
#   filename      = "lambda_function_payload.zip"
#   function_name = "lambda_function_name"
#   role          = aws_iam_role.iam_for_lambda.arn
#   handler       = "index.test"

#   source_code_hash = data.archive_file.lambda.output_base64sha256

#   runtime = "nodejs18.x"

#   environment {
#     variables = {
#       foo = "bar"
#     }
#   }
# }