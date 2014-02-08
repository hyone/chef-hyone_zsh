require 'spec_helper'


_home    = '/home/hoge'
_version = '5.0.5'
_zsh       = ::File.join(_home, "local/apps/zsh-#{_version}/bin/zsh")
_zsh_alias = ::File.join(_home, 'local/bin/zsh')

describe file(_zsh) do
  it { should be_file }
  it { should be_executable }
end

describe file(_zsh_alias) do
  it { should be_file }
  it { should be_linked_to _zsh }
end
