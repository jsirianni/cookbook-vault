default[:vault][:packages] = 'unzip'

# User and group
default[:vault][:user]  = "vault"
default[:vault][:group] = "vault"


# Path to binary / arguments as a string
default[:vault][:path]   = "/usr/local/bin"
default[:vault][:binary] = "/usr/local/bin/vault"
default[:vault][:mode]   = "-server"


# Source URL
default[:vault][:source] = "https://releases.hashicorp.com/vault/0.10.4/vault_0.10.4_linux_amd64.zip"
default[:vault][:sha256] = "b3c8a62e8f2f1b2d9d7ddca3d8bda620ab0091bb038da0d013c26f7b6b18f13a"


# Directories and config file
default[:vault][:conf][:base]   = "/etc/vault/vault.d"
default[:vault][:conf][:pid_dir] = "/var/run/vault"
default[:vault][:conf][:config] = "/etc/vault/vault.d/server.hcl"


# Config params
# https://www.vaultproject.io/guides/operations/vault-ha-consul.html
default[:vault][:conf][:ui]         = false

default[:vault][:conf][:listener][:bind_addr]     = '0.0.0.0' # Must be overridden if instance has multiple network interfaces
default[:vault][:conf][:listener][:bind_port]     = '8200'
default[:vault][:conf][:listener][:cluster_addr]  = '0.0.0.0' # Must be overridden if instance has multiple network interfaces
default[:vault][:conf][:listener][:cluster_port]  = '8201'
default[:vault][:conf][:listener][:tls_disable]   = false

# NOTE: These should be physical interface addresses, not 0.0.0.0 or loopback
default[:vault][:conf][:api_addr]     = "override me"
default[:vault][:conf][:cluster_addr] = "override me"

default[:vault][:conf][:storage][:socket] = "127.0.0.1:8500"  # ip and port that consul is listening on
default[:vault][:conf][:storage][:path]    = "vault/"

default[:vault][:conf][:log_level]  = "info"



default[:vault][:conf][:syslog]     = "true"




# Systemd
default[:vault][:systemd_unit_file] = "/etc/systemd/system/vault.service"
