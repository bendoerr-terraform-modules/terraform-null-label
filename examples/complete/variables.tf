variable "namespace" {
  type    = string
  description = <<-EOT
    Element to ensure resources are generated with names that are globally
    unique and do not collide. This should be a short key such as initials.
    EOT
}

variable "environment" {
  type    = string
  default = ""
  description = <<-EOT
    Element to identify the region and/or the role. If not provided this element
    defaults to <role_short>-<region_short>(-<instance_short>).
    EOT
}

variable "role" {
  type    = string
  default = ""
  description = <<-EOT
    A simple name for the hosting provider account or workspace. Included in
    tags to ensure that identification is simple across accounts. Examples
    'production', 'development', 'main'.
    EOT
}

variable "role_short" {
  type    = string
  default = ""
  description = <<-EOT
    Shortened version of the 'role'.
    Automatic shortening is done by removal of vowels unless handled by special
    cases such as 'production' => 'prod', or 'development' => 'dev'.
    EOT
}

variable "region" {
  type    = string
  default = ""
  description = <<-EOT
    Key for the hosting provider region.
    EOT
}

variable "region_short" {
  type    = string
  default = ""
  description = <<-EOT
    Shortened version of the 'region'.
    Automatic shortening is done by removal of vowels unless handled by special
    cases such as 'us-east-1' => 'ue1', or 'us-west-2' => 'uw2'.
    EOT
}

variable "instance" {
  type    = string
  default = ""
  description = <<-EOT
    Element to identify a tenant or copy of an environment (blue-green
    deployments). This is not used often.
    EOT
}

variable "instance_short" {
  type    = string
  default = ""
  description = <<-EOT
    Shortened version of the 'instance'.
    Automatic shortening is done by removal of vowels.
    EOT
}

variable "attributes" {
  type    = list(string)
  default = []
  description = "Additional id elements that would be appended."
}

variable "tags" {
  type    = map(string)
  default = {}
  description = "Additional tags to include."
}

variable "context" {
  type = any
  default = {
    attributes             = []
    aws_account_name       = ""
    aws_account_name_short = ""
    aws_region             = ""
    aws_region_short       = ""
    dns_namespace          = ""
    environment            = ""
    instance               = ""
    instance_short         = ""
    namespace              = ""
    tags                   = {}
  }
  description = "Allows the merging of an existing context with this one."
}
