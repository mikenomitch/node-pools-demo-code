# Node Pools Demo

This is a group of files used to demo node pools on Nomad.

## Setup

Run nomad using the base-agent-config.hcl file.

Note: change data_dir

Then deploy clients-job.hcl to that cluster to create a bunch of fake clients

Now you have a bunch of fake clients in a few fake node pools

You also might need Consul for this, I forget.

## Demoing Node Pools

Use the things in ./demo to show off node pools. See flow.md for some help.
