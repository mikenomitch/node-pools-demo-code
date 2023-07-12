data_dir   = "/Users/mike/Code/nomad-demo"
datacenter = "aws"

bind_addr = "0.0.0.0"

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled             = true
  disable_remote_exec = false
  max_kill_timeout    = "10m"
  node_pool           = "ingress"
}

acl {
  enabled = true
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ui {
  enabled = true
}

limits {
  http_max_conns_per_client = 0
}
