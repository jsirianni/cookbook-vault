dirs = [
  node[:vault][:conf][:base],
  node[:vault][:conf][:pid_dir]
]


# Directories should only be readable by the vault user and root
dirs.each do |dir|
  directory dir do
    recursive true
    action :create
    owner node[:vault][:user]
    group node[:vault][:group]
    mode "0700"
  end
end


# Create server config
template "#{node[:vault][:conf][:config]}" do
  source "server.hcl.erb"
  owner node[:vault][:user]
  group node[:vault][:group]
  mode "0600"
  notifies :reload, "service[vault]", :delayed
  action :create
end
