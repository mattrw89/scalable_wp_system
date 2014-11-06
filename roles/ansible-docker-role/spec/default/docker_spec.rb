require 'spec_helper'

describe package('lxc-docker') do
  it { should be_installed.with_version('0.11.1') }
end

describe service('docker') do
  it { should be_enabled   }
  it { should be_running   }
end

describe file('/etc/default/docker') do
  it { should be_file }
  its(:content) { should match /^DOCKER_OPTS=""/ }
end

describe process("docker") do
  its(:args) { should match /-d$/ }
end
