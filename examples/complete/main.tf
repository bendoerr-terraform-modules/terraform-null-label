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

module "label" {
  source  = "../.."
  context = module.context.shared
  project = "example"
  name    = "thing"
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

module "label_with_proj" {
  source  = "../.."
  context = module.context_with_proj.shared
  name    = "thing"
}
