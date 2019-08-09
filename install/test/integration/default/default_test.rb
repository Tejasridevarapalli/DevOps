# InSpec test for recipe install::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('apache2') do
  it { should be installed }
end

describe file('/var/www/html/index.html') do
  it {should exist}
  its ('content') {should match (/hello world/)}
end

describe upstart_service('apache2') do
  it {should be_enabled}
  it {should be_running}
end
