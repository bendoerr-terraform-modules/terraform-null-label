// Wrap the Cloudposse Label
module "label" {
  source      = "cloudposse/label/null"
  version     = "0.25.0"
  namespace   = var.context.namespace
  environment = var.context.environment
  stage       = var.project
  name        = var.name
  attributes  = var.context.attributes
  tags        = var.context.tags
}

locals {
  dns_name = var.project != "" ? format(
      "%s.%s.%s",
      var.name,
      var.project,
      var.context.dns_namespace
  ) : format(
      "%s.%s",
      var.name,
      var.context.dns_namespace
  )
}
