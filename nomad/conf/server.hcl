# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/nomad/data"

# Bind to all addresses so that the Nomad agent is available both on loopback
# and externally.
bind_addr = "0.0.0.0"

# Advertise an accessible IP address so the server is reachable by other servers
# and clients. The IPs can be materialized by Terraform or be replaced by an
# init script.
advertise {
    http = "IP:4646"
    rpc  = "IP:4647"
    serf = "IP:4648"
}
