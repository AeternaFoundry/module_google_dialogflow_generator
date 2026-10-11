variable "dialogflow_generators" {
  description = <<EOT
Map of dialogflow_generators, attributes below
Required:
    - location
    - summarization_context (block):
        - few_shot_examples (optional, block):
            - conversation_context (optional, block):
                - message_entries (optional, block):
                    - create_time (optional)
                    - language_code (optional)
                    - role (optional)
                    - text (optional)
            - extra_info (optional)
            - output (required, block):
                - summary_suggestion (optional, block):
                    - summary_sections (required, block):
                        - section (required)
                        - summary (required)
                - tool_call_info (optional, block):
                    - tool_call (required, block):
                        - action (optional)
                        - tool (optional)
                    - tool_call_result (required, block):
                        - action (optional)
                        - error (optional, block):
                            - message (optional)
                            - retryable (optional)
            - summarization_section_list (optional, block):
                - summarization_sections (optional, block):
                    - definition (optional)
                    - key (optional)
                    - type (optional)
        - output_language_code (optional)
        - summarization_sections (optional, block):
            - definition (optional)
            - key (optional)
            - type (optional)
        - version (optional)
Optional:
    - deletion_policy
    - description
    - generator_id
    - project
    - published_model
    - trigger_event
    - inference_parameter (block):
        - max_output_tokens (optional)
        - temperature (optional)
        - top_k (optional)
        - top_p (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location        = string
    deletion_policy = optional(string)
    description     = optional(string)
    generator_id    = optional(string)
    project         = optional(string)
    published_model = optional(string)
    trigger_event   = optional(string)
    summarization_context = object({
      few_shot_examples = optional(list(object({
        conversation_context = optional(object({
          message_entries = optional(list(object({
            create_time   = optional(string)
            language_code = optional(string)
            role          = optional(string)
            text          = optional(string)
          })))
        }))
        extra_info = optional(map(string))
        output = object({
          summary_suggestion = optional(object({
            summary_sections = list(object({
              section = string
              summary = string
            }))
          }))
          tool_call_info = optional(list(object({
            tool_call = object({
              action = optional(string)
              tool   = optional(string)
            })
            tool_call_result = object({
              action = optional(string)
              error = optional(object({
                message   = optional(string)
                retryable = optional(bool)
              }))
            })
          })))
        })
        summarization_section_list = optional(object({
          summarization_sections = optional(list(object({
            definition = optional(string)
            key        = optional(string)
            type       = optional(string)
          })))
        }))
      })))
      output_language_code = optional(string)
      summarization_sections = optional(list(object({
        definition = optional(string)
        key        = optional(string)
        type       = optional(string)
      })))
      version = optional(string)
    })
    inference_parameter = optional(object({
      max_output_tokens = optional(number)
      temperature       = optional(number)
      top_k             = optional(number)
      top_p             = optional(number)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_generators : (
        v.summarization_context.few_shot_examples == null || alltrue([for item in v.summarization_context.few_shot_examples : (item.output.summary_suggestion == null || (length(item.output.summary_suggestion.summary_sections) >= 1))])
      )
    ])
    error_message = "Each summary_sections list must contain at least 1 items"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

