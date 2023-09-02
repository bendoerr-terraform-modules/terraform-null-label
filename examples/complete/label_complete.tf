module "label" {
  source  = "../.."
  context = module.context.shared
  project = "example"
  name    = "thing"
}

output "label_id" {
  value = module.label.id
}

output "label_tags" {
  value = module.label.tags
}

module "label_with_proj" {
  source  = "../.."
  context = module.context_with_proj.shared
  name    = "thing"
}

output "label_with_proj_id" {
  value = module.label_with_proj.id
}

output "label_with_proj_tags" {
  value = module.label_with_proj.tags
}
