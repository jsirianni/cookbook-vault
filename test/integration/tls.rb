describe file('/etc/vault/cert') do
    its('mode') { should cmp '0700' }
    its('owner') { should eq 'vault' }
    its('group') { should eq 'vault' }
end

describe file('/etc/vault/cert/vault.crt') do
    its('mode') { should cmp '0400' }
    its('owner') { should eq 'vault' }
    its('group') { should eq 'vault' }
end

describe file('/etc/vault/cert/vault.key') do
    its('mode') { should cmp '0400' }
    its('owner') { should eq 'vault' }
    its('group') { should eq 'vault' }
end
