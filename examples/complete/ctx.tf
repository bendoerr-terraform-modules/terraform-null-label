module "context" {
  source         = "bendoerr-terraform-modules/context/null"
  version        = "0.4.1"
  namespace      = var.namespace
  environment    = var.environment
  role           = var.role
  role_short     = var.role_short
  region         = var.region
  region_short   = var.region_short
  instance       = var.instance
  instance_short = var.instance_short
  attributes     = var.attributes
  tags           = var.tags
}

output "context" {
  value = module.context.shared
}

module "context_with_proj" {
  source         = "bendoerr-terraform-modules/context/null"
  version        = "0.4.1"
  namespace      = var.namespace
  environment    = var.environment
  role           = var.role
  role_short     = var.role_short
  region         = var.region
  region_short   = var.region_short
  instance       = var.instance
  instance_short = var.instance_short
  project        = var.project
  attributes     = var.attributes
  tags           = var.tags
}

output "context_with_proj" {
  value = module.context_with_proj.shared
}
