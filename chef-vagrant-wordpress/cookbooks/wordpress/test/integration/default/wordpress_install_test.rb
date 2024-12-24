describe package('apache2') do
    it { should be_installed }
end

describe service('apache2') do
    it { should be_running }
    it { should be_enabled }
end

describe command('wp --info') do
    its('stdout') { should match /WordPress Command Line Interface/ }
end
  