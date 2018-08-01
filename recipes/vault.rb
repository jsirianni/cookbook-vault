remote_file "/tmp/vault.zip" do
  source node[:vault][:source]
  owner  node[:vault][:user]
  group  node[:vault][:group]
  mode   "0755"
  action :create
  notifies :run, "execute[extract_vault]", :immediately
  checksum node[:vault][:sha256]
end


execute "extract_vault" do
  command "unzip -o /tmp/vault.zip -d #{node[:vault][:path]}"
  action :nothing
end


file node[:vault][:binary] do
  mode '0700'
  owner node[:vault][:user]
  group node[:vault][:group]
end
