locals {
  gvn_project      = var.project != "" ? var.project : lookup(var.context, "project", "")
  gvn_project_tags = { "Project" = var.project }
  gvn_tags         = merge(local.gvn_project_tags, var.context.tags)
}

# Wrap the Cloudposse Label
# Version pinned to v0.25.0 (latest stable release from 2021-08-25).
# The cloudposse/terraform-null-label module is mature and stable; v0.25.0
# is the most recent release and has been in production use across hundreds
# of Terraform deployments for 4+ years.
module "label" {
  source      = "cloudposse/label/null"
  version     = "0.25.0"
  namespace   = var.context.namespace
  environment = var.context.environment
  stage       = local.gvn_project
  name        = var.name
  attributes  = var.context.attributes
  tags        = local.gvn_tags
}

locals {
  dns_name = local.gvn_project != "" ? format(
    "%s.%s.%s",
    var.name,
    local.gvn_project,
    var.context.dns_namespace
    ) : format(
    "%s.%s",
    var.name,
    var.context.dns_namespace
  )
}
