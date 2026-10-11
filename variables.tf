variable "cloud_guard_data_sources_lookup" {
  description = <<EOT
Map of cloud_guard_data_sources_lookup, attributes below
Required:
    - compartment_id
Optional:
    - access_level
    - compartment_id_in_subtree
    - data_source_feed_provider
    - display_name
    - logging_query_type
    - state
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id            = string
    access_level              = optional(string)
    compartment_id_in_subtree = optional(bool)
    data_source_feed_provider = optional(string)
    display_name              = optional(string)
    logging_query_type        = optional(string)
    state                     = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

