::Chef::Recipe.send(:include, HyoneZsh::Helper)

_user  = get_user(node)
_group = get_user(node)
_home  = _user == 'root' ? '/root' : "/home/#{_user}"

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
