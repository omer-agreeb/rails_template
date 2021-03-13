set :branch, 'staging'
set :server_ip, '15.185.205.146'
set :nginx_server_name, 'staging.alghreeb.me'
server fetch(:server_ip), user: 'ubuntu', roles: %w[web app db]
