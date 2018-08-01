package node[:vault][:packages] do
  action :install
end

include_recipe "vault::user"
include_recipe "vault::config"
include_recipe "vault::vault"
include_recipe "vault::systemd"
