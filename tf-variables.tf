################################################################################
# Input Variables
################################################################################

variable "context" {
  type = object({
    attributes             = list(string)
    aws_account_name       = string
    aws_account_name_short = string
    aws_region             = string
    aws_region_short       = string
    dns_namespace          = string
    environment            = string
    instance               = string
    instance_short         = string
    namespace              = string
    tags                   = map(string)
  })
}

variable "stage" {
  type = string
}

variable "name" {
  type = string
}

variable "global" {
  type    = bool
  default = false
}
