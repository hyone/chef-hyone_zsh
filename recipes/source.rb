#
# Cookbook Name:: zsh::from_source
# Recipe:: default
#
# Copyright 2013, hyone
#
# All rights reserved - Do Not Redistribute
#

::Chef::Recipe.send(:include, HyoneZsh::Helper)

_user    = get_user(node)
_group   = get_group(node, _user)
_prefix  = node['hyone_zsh']['prefix']
_version = node['hyone_zsh']['version']
# To avoid to fail configure without controlling terminal (i.e. configure from chef)
# use --without-tcsetpgrp (this is used only when configure test, so no effect to build binary)
# see also: 'INSTALL' file in zsh source distribution
_configure_options = node['hyone_zsh']['configure_options'] ||
  '--without-tcsetpgrp'


include_recipe 'build-essential'

case node['platform_family']
when 'rhel', 'fedora'
  %w[readline-devel]
when 'debian'
  %w[libreadline-dev]
end.each do |pkg|
  package pkg do
    action [:install]
  end
end

hyone_source_package 'zsh' do
  version _version
  source_url "http://downloads.sourceforge.net/project/zsh/zsh/#{_version}/zsh-#{_version}.tar.gz"
  configure_options _configure_options
  user  _user  if _user
  group _group if _group
  prefix_base _prefix if _prefix
end
