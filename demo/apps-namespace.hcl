name        = "apps"
description = "For application developers"

capabilities {
  enabled_task_drivers  = ["docker", "exec", "raw_exec"]
  disabled_task_drivers = []
}

node_pool_config {
  default = "default"
  allowed = []
  denied  = ["gpu"]
}
