name 'nginx_application'
maintainer 'Lester Celestial'
maintainer_email 'lesterc@sourcepad.com'
license 'Apache 2.0'
description 'Installs nginx and configures virtual hosts'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.1'

recipe 'nginx_application', "Installs and configures nginx on a server."

depends 'apt'
depends 'nginx'

supports 'ubuntu'
