variable "lambda_function_name" {
    type = string
    default = "send-mail"
    description = "The name of the Lambda function"
}

variable "lambda_description" {
  type        = string
  default     = "SNS triggers Lambda Fucntion"
  description = "Description to assign to Lambda Function."
}

variable "lambda_runtime" {
  type        = string
  default     = "python3.8"
  description = "Lambda runtime to use for the function."
}

variable "email" {
  type = string
  default = "pauline.contat01@etu.umontpellier.fr"
}