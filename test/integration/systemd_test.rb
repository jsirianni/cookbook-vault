# Read node attributes
node = json("/tmp/kitchen/dna.json").params

describe service "vault" do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
end

describe file('/etc/systemd/system/vault.service') do
    its('mode') { should cmp '0644' }
    its('owner') { should eq 'vault' }
    its('group') { should eq 'vault' }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep Requires') do
   its('stdout') { should match (/Requires=network-online.target/) }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep After') do
   its('stdout') { should match (/After=network-online.target/) }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep User') do
   its('stdout') { should match (/User=vault/) }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep Group') do
   its('stdout') { should match (/Group=vault/) }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep Restart') do
   its('stdout') { should match (/Restart=on-failure/) }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep "ExecStart" -A 2 | xargs | xargs') do
   its('stdout') { should match ("ExecStart=/usr/local/bin/vault server -config=/etc/vault/vault.d/server.hcl -log-level=info") }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep ExecReload') do
   its('stdout') { should match ("ExecReload=/bin/kill -HUP $MAINPID\n") }
end

describe command('sudo cat /etc/systemd/system/vault.service | grep KillSignal') do
   its('stdout') { should match (/KillSignal=SIGTERM/) }
end
