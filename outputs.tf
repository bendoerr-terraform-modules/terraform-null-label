output "id" {
  value       = module.label.id
  description = "Disambiguated ID"
}

output "name" {
  value       = module.label.name
  description = "Normalized name"
}

output "namespace" {
  value       = module.label.namespace
  description = "Normalized namespace"
}

output "project" {
  value       = module.label.stage
  description = "Normalized project"
}

output "environment" {
  value       = module.label.environment
  description = "Normalized environment"
}

output "attributes" {
  value       = module.label.attributes
  description = "List of attributes"
}

output "delimiter" {
  value       = module.label.delimiter
  description = "Delimiter between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

output "tags" {
  value       = module.label.tags
  description = "Normalized Tag map"
}

output "tags_as_list_of_maps" {
  value       = module.label.tags_as_list_of_maps
  description = "Additional tags as a list of maps, which can be used in several AWS resources"
}

output "label_order" {
  value       = module.label.label_order
  description = "The naming order of the id output and Name tag"
}

output "dns_name" {
  value = local.dns_name
  description = "Normalized DNS Name"
}
