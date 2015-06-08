require 'json'
require 'ostruct'

include_recipe 'apt'
include_recipe 'apt::unattended-upgrades'

# Create the dhparam pem file first before executing the nginx install recipe
dhparam_path = "#{node['nginx']['dhparam_dir']}/#{node['nginx']['dhparam_pem']}"
bash "create_strong_dhparams" do
  user 'root'
  code <<-EOF
    openssl dhparam -out #{dhparam_path} 4096
    chmod 400 #{dhparam_path}
  EOF
  not_if { File.exist?(dhparam_path) }
end

include_recipe 'nginx'

jsonified = node['nginx_ruby_backend']['applications'].to_json
applications = JSON.parse(jsonified, object_class: OpenStruct)

applications.each do |application|
  template "#{node['nginx']['dir']}/sites-available/#{application.site_name}" do
    source "application.erb"
    owner 'root'
    group 'root'
    variables application: application.configuration

    action :create
  end

  nginx_site application.site_name
end