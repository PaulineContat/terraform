data "aws_caller_identity" "current" {}

data "archive_file" "lambda_exporter" {
  output_path = "${path.module}/lambda_function_payload.zip"
  source {
    content  = "1"
    filename = "send-mail.py"
  }
  type        = "zip"
}