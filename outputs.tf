output "dialogflow_generators_id" {
  description = "Map of id values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no id are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dialogflow_generators_deletion_policy" {
  description = "Map of deletion_policy values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dialogflow_generators_description" {
  description = "Map of description values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no description are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.description if v.description != null && length(v.description) > 0 }
}
output "dialogflow_generators_generator_id" {
  description = "Map of generator_id values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no generator_id are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.generator_id if v.generator_id != null && length(v.generator_id) > 0 }
}
output "dialogflow_generators_inference_parameter" {
  description = "Map of inference_parameter values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no inference_parameter are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => one(v.inference_parameter) if v.inference_parameter != null && length(v.inference_parameter) > 0 }
}
output "dialogflow_generators_location" {
  description = "Map of location values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no location are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.location if v.location != null && length(v.location) > 0 }
}
output "dialogflow_generators_name" {
  description = "Map of name values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no name are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dialogflow_generators_project" {
  description = "Map of project values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no project are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.project if v.project != null && length(v.project) > 0 }
}
output "dialogflow_generators_published_model" {
  description = "Map of published_model values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no published_model are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.published_model if v.published_model != null && length(v.published_model) > 0 }
}
output "dialogflow_generators_summarization_context" {
  description = "Map of summarization_context values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no summarization_context are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => one(v.summarization_context) if v.summarization_context != null && length(v.summarization_context) > 0 }
}
output "dialogflow_generators_trigger_event" {
  description = "Map of trigger_event values across all dialogflow_generators, keyed the same as var.dialogflow_generators except keys with no trigger_event are omitted"
  value       = { for k, v in google_dialogflow_generator.dialogflow_generators : k => v.trigger_event if v.trigger_event != null && length(v.trigger_event) > 0 }
}

