output "context" {
  value       = module.context.shared
  description = "The normalized context values"
}

output "context_with_proj" {
  value       = module.context_with_proj.shared
  description = "The normalized context values when project is set"
}

output "label_id" {
  value       = module.label.id
  description = "The full label ID or name"
}

output "label_tags" {
  value       = module.label.tags
  description = "The full label tags"
}

output "label_with_proj_id" {
  value       = module.label_with_proj.id
  description = "The full label ID or name"
}

output "label_with_proj_tags" {
  value       = module.label_with_proj.tags
  description = "The full label tags"
}
