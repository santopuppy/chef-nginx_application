Nginx application server chef cookbook
======================================

Requirements
------------
### Cookbooks
The following cookbooks are direct dependencies:

- apt
- nginx

### Platforms
The following platforms are supported and tested under test kitchen:

- Ubuntu 14.04

Other Debian family distributions are assumed to work.

Attributes
----------
- `node['nginx']['dhparam_dir']` - Used to set which directory to create the `dhparam.pem` file. Defaults to `'/etc/ssl/certs'`
- `node['nginx']['dhparam_pem']` - The file name of the dhparam. Defaults to `dhparam.pem`
- `node['nginx_application']['applications']` - An array of hashes that contains the virtual hosts that would be created in the `node['nginx']['dir']/sites-available` directory. The contents of an individual hash is describled in the following:
```ruby
{
  site_name: 'testsite.com', # Used for the virtual host file name
  configuration: {
    name: 'test_app',                                             # Used for the upstram name
    upstream_servers: [ { address: '10.0.1.197', port: 3000 } ],  # The upstream information
    server_name: 'testsite.com',                                  # Used for the server_name directive
    ssl: true,                                                    # Enable ssl
    ssl_certificate: "/etc/nginx/ssl/ssl-bundle.crt",             # Path to the ssl certificate.
    ssl_certificate_key: "/etc/nginx/ssl/testsite.key",           # Path to the ssl key
    ssl_stapling: true,                                           # Enables OCSP stapling
    application_root: "/path/to/application/root/public",         # Sets the nginx root directive
    x_frame_options: "DENY"                                       # Sets X-Frame-Options
  }
}
```

Recipes 
-------
This cookbook installs and configures nginx on the server as well as create virtual hosts.

### default
This recipe creates virtual host entries in the `node['nginx']['dir']/sites-available` directory from the attribute `node['nginx_application']['applications']`. Those entries are then enabled by adding them to the `node['nginx']['dir']/sites-enabled` directory.

The cookbook also creates a secure dhparam pem file.

License & Authors
-----------------
- Author:: Lester Celestial

```text
Copyright 2015, Lester Celestial

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

