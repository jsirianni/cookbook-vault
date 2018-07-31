default[:vault][:packages] = 'unzip'

# User and group
default[:vault][:user]  = "vault"
default[:vault][:group] = "vault"


# Path to binary / arguments as a string
default[:vault][:path]   = "/usr/local/bin"
default[:vault][:binary] = "/usr/local/bin/vault"
default[:vault][:mode]   = "-server"


# Source URL
default[:vault][:source] = "https://releases.hashicorp.com/vault/1.2.1/vault_1.2.1_linux_amd64.zip"
default[:vault][:sha256] = "e4146334be453146890023303da3e0c815669e108a18fb7d742745df3414a31a"


# Config directories
default[:vault][:conf][:base]         = "/etc/vault/vault.d"


# Config params
default[:vault][:conf][:ui]         = false
default[:vault][:conf][:server]     = true
default[:vault][:conf][:beta_ui]    = 0     # set to 1 to enable
default[:vault][:conf][:bootstrap]  = false # NOTE: Set to true on a single node, during cluster formation
default[:vault][:conf][:datacenter] = "default" # NOTE: Override w/ role
default[:vault][:conf][:encrypt]    = ""        # NOTE: Override w/ role
default[:vault][:conf][:log_level]  = "info"
default[:vault][:conf][:syslog]     = "true"
default[:vault][:conf][:data_dir]   = "/opt/vault"
default[:vault][:conf][:retry_join] = '["10.1.10.1"]'     # NOTE: Override w/ role # NOTE: Same as startjoin but will retry
default[:vault][:conf][:bind_addr]  = '0.0.0.0' # Must be overridden if instance has multiple network interfaces
default[:vault][:conf][:api_port]   = '8500' # default port


# Systemd
default[:vault][:systemd_unit_file] = "/etc/systemd/system/vault.service"
