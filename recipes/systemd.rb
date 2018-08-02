# Configure the unit file
template node[:vault][:systemd_unit_file] do
  source "vault.service.erb"
  owner node[:vault][:user]
  group node[:vault][:group]
  mode "0644"
  notifies :run, "execute[reload_systemd]", :immediately
end


# Reload systemd if required
execute "reload_systemd" do
  command "systemctl daemon-reload"
  action :nothing
  notifies :reload, "service[vault]", :delayed
end


# Enable and run vault
service "vault" do
  action [:enable, :start]
end
