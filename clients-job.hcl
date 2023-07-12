locals {
  nomad_path = "/Users/mike/go/bin/nomad"

  client_config = <<EOF
data_dir   = "{{env "NOMAD_TASK_DIR"}}/data"
name       = "%s"
datacenter = "%s"

client {
  enabled = true
  node_pool = "%s"

  server_join {
    retry_join = [%s]
  }
}

server {
  enabled = false
}

ports {
  http = "56%d6"
  rpc  = "56%[5]d7"
  serf = "56%[5]d8"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}
EOF
}

job "ingress-proxy" {
  node_pool = "ingress"

  group "clients" {

    task "client-1" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "aws-client-1", "aws", "default", "\"127.0.0.1\"", 5)
        destination = "local/config.hcl"
      }
    }

    task "client-2" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "aws-client-2", "aws", "default", "\"127.0.0.1\"", 6)
        destination = "local/config.hcl"
      }
    }

    task "client-3" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "aws-client-3", "aws", "gpu", "\"127.0.0.1\"", 7)
        destination = "local/config.hcl"
      }
    }

    task "client-4" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "aws-client-4", "aws", "gpu", "\"127.0.0.1\"", 8)
        destination = "local/config.hcl"
      }
    }

    task "client-5" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "gcp-client-1", "gcp", "default", "\"127.0.0.1\"", 9)
        destination = "local/config.hcl"
      }
    }

    task "client-6" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "gcp-client-2", "gcp", "default", "\"127.0.0.1\"", 0)
        destination = "local/config.hcl"
      }
    }

    task "client-7" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "gcp-client-3", "gcp", "gpu", "\"127.0.0.1\"", 1)
        destination = "local/config.hcl"
      }
    }

    task "client-8" {
      driver = "raw_exec"

      config {
        command = local.nomad_path
        args    = ["agent", "-config", "local/config.hcl"]
      }

      template {
        data        = format(local.client_config, "gcp-client-4", "gcp", "gpu", "\"127.0.0.1\"", 2)
        destination = "local/config.hcl"
      }
    }
  }
}
