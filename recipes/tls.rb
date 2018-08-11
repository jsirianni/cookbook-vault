directory node[:vault][:conf][:listener][:cert_dir] do
  recursive true
  action :create
  owner node[:vault][:user]
  group node[:vault][:group]
  mode "0700"
end


# Enforce file permissions but do not change the file
# Chef will create an empty file if not exists, which will
# cause fault to fail if tsl is enabled.
#
# NOTE: set `node[:vault][:conf][:listener][:tls_disable] = true`
# to verify that the service is working. Then manually add the cert
# and key to the cert directory.
#
[node[:vault][:conf][:listener][:cert], node[:vault][:conf][:listener][:key]].each do |cert_file|
  file cert_file do
    owner node[:vault][:user]
    group node[:vault][:group]

    # vault should read but never write
    mode '0400'

    # enforce permissions but never overwrite the cert
    action :create
  end
end
