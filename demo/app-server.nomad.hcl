job "app-server" {
  namespace = "apps"

  /* constraint {
    attribute = "${node.node_class}"
    operator  = "!="
    value     = "gpu"
  } */

  group "webapp" {
    count = 4

    network {
      mode = "host"
      port "http" {}
    }

    task "rails" {
      driver = "raw_exec"

      resources {
        memory = 2000
        cpu    = 2000
      }

      config {
        command = "python3"
        args    = ["-m", "http.server", "${NOMAD_PORT_http}", "--directory", "/tmp"]
      }

      service {
        provider = "nomad"
        name     = "core-api"
        port     = "http"

        check {
          name     = "health"
          type     = "http"
          path     = "/"
          interval = "5s"
          timeout  = "1s"
          method   = "GET"
        }
      }
    }

    update {
      max_parallel      = 0
      min_healthy_time  = "5s"
      healthy_deadline  = "30s"
      progress_deadline = "1m"
      auto_revert       = true
    }
  }
}