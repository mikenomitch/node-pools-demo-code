name        = "ml"
description = "For machine learning workloads"

capabilities {
  enabled_task_drivers  = ["docker", "exec", "raw_exec"]
  disabled_task_drivers = []
}

node_pool_config {
  default = "gpu"
  allowed = ["default"]
}
