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

  validation {
    condition     = can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.name))
    error_message = "name must contain only lowercase alphanumeric characters and hyphens, and cannot start or end with a hyphen."
  }

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 32
    error_message = "name must be between 1 and 32 characters."
  }
}

variable "project" {
  type        = string
  default     = ""
  description = "Name of the project or application, this can override the context's project"
  nullable    = false

  validation {
    condition     = var.project == "" || can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.project))
    error_message = "project must be empty or contain only lowercase alphanumeric characters and hyphens, and cannot start or end with a hyphen."
  }

  validation {
    condition     = var.project == "" || (length(var.project) >= 1 && length(var.project) <= 32)
    error_message = "project must be empty or between 1 and 32 characters."
  }
}
