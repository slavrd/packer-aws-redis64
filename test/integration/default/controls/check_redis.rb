control 'check_redis' do

  describe package('redis-server') do
    it { should be_installed }
  end

  describe service('redis') do
    it {should be_enabled}
    it {should be_running}
  end

  describe file('/etc/redis/redis.conf') do
    its('owner') { should eq 'redis'}
    its('group') { should eq 'redis'}
  end

  describe port(6379) do
    it { should be_listening }
    its('processes') { should include 'redis-server' }
    its('protocols') { should include 'tcp' }
    its('addresses') { should include '0.0.0.0' }
  end

end
