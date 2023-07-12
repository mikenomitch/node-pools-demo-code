## Setup

export NOMAD_LICENSE=
nomad agent --config=./base-agent-config.hcl
nomad acl bootstrap
export NOMAD_TOKEN=
nomad ui -authenticate
nomad run clients-job.hcl
nomad namespace apply ./apps-namespace.hcl
nomad namespace apply ./ml-namespace.hcl
nomad node pool apply ./gpu-node-pool.hcl

## Demo

nomad run app-server.nomad.hcl

nomad run -detach ml-workload-a.nomad.hcl & nomad run -detach ml-workload-b.nomad.hcl & nomad run -detach ml-workload-c.nomad.hcl & nomad run -detach ml-workload-d.nomad.hcl
