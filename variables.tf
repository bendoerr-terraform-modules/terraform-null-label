variable "context" {
  type = object({
    attributes     = list(string)
    dns_namespace  = string
    environment    = string
    instance       = string
    instance_short = string
    namespace      = string
    region         = string
    region_short   = string
    role           = string
    role_short     = string
    project        = string
    tags           = map(string)
  })
  description = "Shared Context from Ben's terraform-null-label"
  nullable    = false
}

variable "name" {
  type        = string
  description = "Name of this resource"
  nullable    = false
}

variable "project" {
  type        = string
  default     = ""
  description = "Name of the project or application, this can override the context's project"
  nullable    = false
}
