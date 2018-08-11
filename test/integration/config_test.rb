# Read node attributes
node = json("/tmp/kitchen/dna.json").params


directories = ['/etc/vault/vault.d', "/var/run/vault"].each do |dir|
    describe directory(dir) do
      its('mode') { should cmp '0700' }
      its('owner') { should eq 'vault' }
      its('group') { should eq 'vault' }
    end
end

describe file('/etc/vault/vault.d/server.hcl') do
    its('mode') { should cmp '0600' }
    its('owner') { should eq 'vault' }
    its('group') { should eq 'vault' }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep ui') do
   its('stdout') { should match ("ui = \"true\"") }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep listener') do
   its('stdout') { should match ("listener \"tcp\" {") }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep storage') do
    its('stdout') { should match ("storage \"consul\" {") }
end


# NOTE: The following test validate the key/value pairs that are not going to reflect
# production use as they are for test kitchen only!
#
describe command('sudo cat /etc/vault/vault.d/server.hcl | grep path | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "path = #{node['vault']['conf']['storage']['path']}"
            )
        }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep tls_disable | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "tls_disable = #{node['vault']['conf']['listener']['tls_disable']}"
            )
        }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep tls_cert_file | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "tls_cert_file = #{node['vault']['conf']['listener']['tls_cert_file']}"
            )
        }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep tls_key_file | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "tls_key_file = #{node['vault']['conf']['listener']['tls_key_file']}"
            )
        }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep tls_min_version | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "tls_min_version = #{node['vault']['conf']['listener']['tls_min_version']}"
            )
        }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep address | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "address = #{node['vault']['conf']['listener']['bind_addr']}:#{node['vault']['conf']['listener']['bind_port']}"
            )
        }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep cluster_address | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "cluster_address = #{node['vault']['conf']['listener']['cluster_addr']}:#{node['vault']['conf']['listener']['cluster_port']}"
            )
        }
end


describe command('sudo cat /etc/vault/vault.d/server.hcl | grep api_addr | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "api_addr = #{node['vault']['conf']['api_addr']}:#{node['vault']['conf']['listener']['bind_port']}"
            )
        }
end

describe command('sudo cat /etc/vault/vault.d/server.hcl | grep cluster_addr | xargs') do
    # NOTE: `xargs` removes the quotes from the value!
    its('stdout') {
        should match (
            "cluster_addr = #{node['vault']['conf']['cluster_addr']}:#{node['vault']['conf']['listener']['cluster_port']}"
            )
        }
end
