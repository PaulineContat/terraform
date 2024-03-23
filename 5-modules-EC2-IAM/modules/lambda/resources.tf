resource "aws_lambda_function" "lambda_function" {
  filename         = "${path.module}/lambda_function_payload.zip"
  function_name    = var.lambda_function_name
  description      = var.lambda_description
  role             = var.lambda_role_arn
  handler          = format("%s.handler", var.lambda_function_name)
  source_code_hash = filebase64sha256("./modules/lambda/lambda_function_payload.zip")
  runtime          = var.lambda_runtime
}