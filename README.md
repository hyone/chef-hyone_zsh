# hyone_zsh cookbook

# Requirements

# Usage

```json
{
  "hyone_zsh": {
    "user": "hoge",
    "group": "hoge",
    "version": "5.0.5"
  },

  "run_list": [
    "recipe[hyone_zsh::from_source]"
  ]
}
```

# Recipes

## hyone_zsh::default

Install zsh from os package system
( Currently don't use attributes below )

## hyone_zsh::from_source

Build and install zsh from its source distribution.
customizable by attributes like below.

# Attributes

- `node.hyone_zsh.user`: owner of installed zsh distribution
- `node.hyone_zsh.group`: group of installed zsh distribution
- `node.hyone_zsh.prefix_base`: base path of installed zsh distribution
  - application is installed to `"#{node.hyone_zsh.prefix_base}/apps/zsh-#{node.hyone_zsh.version}"`
  - and link to files `'bin/'` to `"#{node.hyone_zsh.prefix_base}/bin/"`
  - if `prefix_base` is not specified :
    - `node.hyone_zsh.user` is `'root'`, then prefix is `'/usr/local'`
    - `node.hyone_zsh.user` is non-root, then prefix is `"#{ENV['HOME']}/local"`
- `node.hyone_zshversion`: installed zsh version

# Author

Author:: hyone (<hyone.development@gmail.com>)
