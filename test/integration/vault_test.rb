# Read node attributes
node = json("/tmp/kitchen/dna.json").params

# Archive should exist
describe file('/tmp/vault.zip') do
    its('mode') { should cmp '0755' }
    its('owner') { should eq 'vault' }
    its('group') { should eq 'vault' }
end

# Binary should exist in the install dir
describe file('/usr/local/bin/vault') do
    its('mode') { should cmp '0700' }
    its('owner') { should eq 'vault' }
    its('group') { should eq 'vault' }
end

# Verify version 1.1.0
describe command("sudo /usr/local/bin/vault --version") do
   its('stdout') { should match (/v0.10.4/) }
end

# Check status
describe command("sudo /usr/local/bin/vault status -address=http://#{node['vault']['conf']['listener']['bind_addr']}:8200 | grep Sealed") do
    its('stdout') { should match (/true/) }
end

describe command("sudo /usr/local/bin/vault status -address=http://#{node['vault']['conf']['listener']['bind_addr']}:8200 | grep 'HA Enabled'") do
    its('stdout') { should match (/true/) }
end

# Consul Cluster communication
describe port(8301) do
  it { should be_listening }
end

# Consul Web interface
describe port(8500) do
  it { should be_listening }
end

# Vault API / UI / Cluster
describe port(8200) do
  it { should be_listening }
end
