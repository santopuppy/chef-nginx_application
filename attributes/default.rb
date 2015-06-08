# Run updates
node.set['apt']['compile_time_update'] = true

# Setup unattended updates on this server
node.set['apt']['unattended_upgrades']['enable'] = true
node.set['apt']['unattended_upgrades']['allowed_origins'] = ["${distro_id} ${distro_codename}-security",
                                                         "${distro_id} ${distro_codename}-updates"]

default['nginx']['dhparam_dir'] = '/etc/ssl/certs'
default['nginx']['dhparam_pem'] = 'dhparam.pem'

dhparam_path = "#{node['nginx']['dhparam_dir']}/#{node['nginx']['dhparam_pem']}"

node.set['nginx']['extra_configs'] =  {
                                        "ssl_ciphers" => '"EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH"',
                                        "ssl_protocols" => "TLSv1 TLSv1.1 TLSv1.2",
                                        "ssl_prefer_server_ciphers" => "on",
                                        "ssl_session_cache" => "shared:SSL:10m",
                                        "ssl_dhparam" => dhparam_path 
                                      }

default['nginx_application']['applicatiions'] = []
