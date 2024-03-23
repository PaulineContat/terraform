variable "instance_name" {
  description = "instance name"
  type    = string
  default = "instance1"
}

variable "instance_type" {
  description = "instance type (eg: t3.nano)"
  type    = string
  default = "t3.nano"
}

variable "aws_iam_role_name" {
  type = string
  default = "LabInstanceProfile"
}

variable "lambda_arn" {
  type        = string
  description = "The ARN of the Lambda function to be invoked"
}