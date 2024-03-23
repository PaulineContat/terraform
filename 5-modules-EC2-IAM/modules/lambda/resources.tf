resource "null_resource" "lambda_exporter" {
  triggers = {
    index = "${base64sha256(file("${path.module}/send-mail.py"))}"
  }
}

data "archive_file" "lambda_exporter" {
  output_path = "${path.module}/lambda_function_payload.zip"
  source {
    content  = "1"
    filename = "send-mail.py"
  }
  type        = "zip"
}

resource "aws_lambda_function" "lambda_function" {
  filename         = "${path.module}/lambda_function_payload.zip"
  function_name    = var.lambda_function_name
  description      = var.lambda_description
  role             = local.lambda_role_arn
  handler          = format("%s.handler", var.lambda_function_name)
  source_code_hash = "${data.archive_file.lambda_exporter.output_base64sha256}"
  runtime          = var.lambda_runtime
}

locals {
  lambda_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/LabRole"
}