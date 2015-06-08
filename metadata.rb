name 'nginx_ruby_backend'
maintainer 'Lester Celestial'
maintainer_email 'lesterc@sourcepad.com'
license 'Apache 2.0'
description 'Installs nginx and configures virtual hosts'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

recipe 'nginx_ruby_backend', "Installs and configures nginx on a server."

depends 'apt'
depends 'nginx'

supports 'ubuntu'
