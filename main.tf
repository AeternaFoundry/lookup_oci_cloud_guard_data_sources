data "oci_cloud_guard_data_sources" "cloud_guard_data_sources_lookup" {
  for_each = var.cloud_guard_data_sources_lookup

  compartment_id            = each.value.compartment_id
  access_level              = each.value.access_level
  compartment_id_in_subtree = each.value.compartment_id_in_subtree
  data_source_feed_provider = each.value.data_source_feed_provider
  display_name              = each.value.display_name
  logging_query_type        = each.value.logging_query_type
  state                     = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

