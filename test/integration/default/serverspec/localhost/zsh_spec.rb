require 'spec_helper'


describe package('zsh') do
  it { should be_installed }
end
