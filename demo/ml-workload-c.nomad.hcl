job "ml-workload-c" {
  namespace = "ml"

  group "runner" {
    count = 1

    network {
      mode = "host"
      port "http" {}
    }

    task "pytorch" {
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

  datacenters = ["gcp"]
}
