variable "instances" {
  default = {}
  type    = map(object({
    instance_name = string
    instance_type = string
    aws_iam_role_name = string
    user_data = string
  }))
}