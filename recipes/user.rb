group node[:vault][:group] do
  action :create
end

user node[:vault][:user] do
  shell  '/sbin/nologin'
  gid     node[:vault][:group]
  system  true
  manage_home false
  action :create
end
