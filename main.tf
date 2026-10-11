resource "google_dialogflow_generator" "dialogflow_generators" {
  for_each = var.dialogflow_generators

  location        = each.value.location
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  generator_id    = each.value.generator_id
  project         = each.value.project
  published_model = each.value.published_model
  trigger_event   = each.value.trigger_event

  summarization_context {
    dynamic "few_shot_examples" {
      for_each = each.value.summarization_context.few_shot_examples != null ? each.value.summarization_context.few_shot_examples : []
      content {
        dynamic "conversation_context" {
          for_each = few_shot_examples.value.conversation_context != null ? [few_shot_examples.value.conversation_context] : []
          content {
            dynamic "message_entries" {
              for_each = conversation_context.value.message_entries != null ? conversation_context.value.message_entries : []
              content {
                create_time   = message_entries.value.create_time
                language_code = message_entries.value.language_code
                role          = message_entries.value.role
                text          = message_entries.value.text
              }
            }
          }
        }
        extra_info = few_shot_examples.value.extra_info
        output {
          dynamic "summary_suggestion" {
            for_each = few_shot_examples.value.output.summary_suggestion != null ? [few_shot_examples.value.output.summary_suggestion] : []
            content {
              dynamic "summary_sections" {
                for_each = summary_suggestion.value.summary_sections
                content {
                  section = summary_sections.value.section
                  summary = summary_sections.value.summary
                }
              }
            }
          }
          dynamic "tool_call_info" {
            for_each = few_shot_examples.value.output.tool_call_info != null ? few_shot_examples.value.output.tool_call_info : []
            content {
              tool_call {
                action = tool_call_info.value.tool_call.action
                tool   = tool_call_info.value.tool_call.tool
              }
              tool_call_result {
                action = tool_call_info.value.tool_call_result.action
                dynamic "error" {
                  for_each = tool_call_info.value.tool_call_result.error != null ? [tool_call_info.value.tool_call_result.error] : []
                  content {
                    message   = error.value.message
                    retryable = error.value.retryable
                  }
                }
              }
            }
          }
        }
        dynamic "summarization_section_list" {
          for_each = few_shot_examples.value.summarization_section_list != null ? [few_shot_examples.value.summarization_section_list] : []
          content {
            dynamic "summarization_sections" {
              for_each = summarization_section_list.value.summarization_sections != null ? summarization_section_list.value.summarization_sections : []
              content {
                definition = summarization_sections.value.definition
                key        = summarization_sections.value.key
                type       = summarization_sections.value.type
              }
            }
          }
        }
      }
    }
    output_language_code = each.value.summarization_context.output_language_code
    dynamic "summarization_sections" {
      for_each = each.value.summarization_context.summarization_sections != null ? each.value.summarization_context.summarization_sections : []
      content {
        definition = summarization_sections.value.definition
        key        = summarization_sections.value.key
        type       = summarization_sections.value.type
      }
    }
    version = each.value.summarization_context.version
  }

  dynamic "inference_parameter" {
    for_each = each.value.inference_parameter != null ? [each.value.inference_parameter] : []
    content {
      max_output_tokens = inference_parameter.value.max_output_tokens
      temperature       = inference_parameter.value.temperature
      top_k             = inference_parameter.value.top_k
      top_p             = inference_parameter.value.top_p
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

