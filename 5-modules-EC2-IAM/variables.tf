variable "instances" {
  type = map(object({
    name           = string
    instance_type  = string
    user_data      = string
  }))
  default = {}
}