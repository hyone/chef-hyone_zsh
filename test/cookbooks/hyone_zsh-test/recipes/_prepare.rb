::Chef::Recipe.send(:include, HyoneZsh::Helper)

_user  = get_user(node)
_group = get_user(node)
_home  = _user == 'root' ? '/root' : "/home/#{_user}"


case
when platform?('ubuntu')
  include_recipe 'apt'
end

# Generate locales to avoid warnings like:
# 'bash: warning: setlocale: LC_ALL: cannot change locale (ja_JP.UTF-8)'
case
when platform?('centos')
  execute 'generate locale' do
    command 'localedef -f UTF-8 -i ja_JP /usr/lib/locale/ja_JP.UTF-8'
    action [:run]
  end
when platform?('ubuntu')
  execute 'locale-gen' do
    command 'locale-gen ja_JP.UTF-8'
    action [:run]
  end
end

## user and group
user _user do
  home _home
  supports manage_home: true
  shell '/bin/bash'
  action [:create]
end

group _group do
  members [_user]
  action [:create]
end
