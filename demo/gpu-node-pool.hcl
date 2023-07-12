node_pool "gpu" {
  description = "Pool of nodes used for machine learning workloads"

  scheduler_config {
    scheduler_algorithm             = "binpack"
    memory_oversubscription_enabled = false
  }
}
