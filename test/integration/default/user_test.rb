describe user('vault') do
  it { should exist }
  its('group') { should eq 'vault' }
  its('shell') { should eq '/sbin/nologin' }
end
