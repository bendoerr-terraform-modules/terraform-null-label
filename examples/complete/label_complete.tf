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
