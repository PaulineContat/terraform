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

variable "lambda_arn" {
  type        = string
  description = "The ARN of the Lambda function to be invoked"
}

variable "instances" {
  type = map(object({
    name            = string
    instance_type   = string
    user_data       = string
  }))
}

variable "sns_topic_arn" {
  type = string
  description = "The ARN of the SNS topic to send notifications to"
}