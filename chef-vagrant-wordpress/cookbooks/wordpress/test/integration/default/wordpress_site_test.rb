describe http('http://localhost') do
    its('status') { should cmp 200 }
    its('body') { should match /WordPress/ }
end

describe port(80) do
    it { should be_listening }
end
  