module "label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.25.0"
  namespace   = var.context.namespace
  environment = var.context.environment
  stage       = var.stage
  name        = var.name
  attributes  = var.context.attributes
  tags        = var.context.tags
}

locals {
  dns_name = var.stage != "" ? format(
      "%s.%s.%s",
      var.name,
      var.stage,
      var.context.dns_namespace
  ) : format(
      "%s.%s",
      var.name,
      var.context.dns_namespace
  )
}
