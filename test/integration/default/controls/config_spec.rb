# Overide by OS
case os[:family]
when 'arch', 'suse'
  config_filename = '/etc/dhcpd.conf'
when 'debian'
  config_filename = '/etc/dhcp/dhcpd.conf'
  service_config_filename = '/etc/default/isc-dhcp-server'
when 'freebsd'
  config_filename = '/usr/local/etc/dhcpd.conf'
  service_config_filename = '/etc/rc.conf.d/dhcpd'
when 'redhat'
  config_filename = '/etc/dhcp/dhcpd.conf'
end

control 'DHCPD configuration' do
  title 'should be generated properly'

  describe file(config_filename) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
  end
end

control 'DHCPD service configuration' do
  title 'should be generated properly'

  describe file(config_filename) do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
  end
end
