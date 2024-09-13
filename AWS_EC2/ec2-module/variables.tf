variable "key_name" { default = "" }

variable "subnet_id" { default = "" }

variable "instance_type" { default = "" }

variable "ami" { default = "" }

variable "user_data" { default = "" }

variable "vpc_security_group_ids" {
  default = []
  type    = list(string)
}
variable "tags" {
  type        = map(string)
  default     = {}
}
