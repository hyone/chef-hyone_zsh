name             'hyone_zsh'
maintainer       'hyone'
maintainer_email 'hyone.development@gmail.com'
license          'All rights reserved'
description      'Installs/Configures zsh'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          'build-essential'
depends          'hyone_source_package', '>= 0.2.0'

supports         'ubuntu', '>= 12.04'
supports         'centos', ">= 6.0"
