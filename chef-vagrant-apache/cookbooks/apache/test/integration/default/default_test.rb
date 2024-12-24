directory node['vagrant_path'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file "#{node['vagrant_path']}/index.html" do
  source 'index.html'
  owner 'root'
  group 'root'
  mode '0644'
end

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end
