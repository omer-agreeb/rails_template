lock "~> 3.15.0"
set :application, 'rails_template_6'
set :repo_url, 'git@github.com:omer-agreeb/rails_template_6.git'
set :rails_env, fetch(:stage)
set :deploy_to, "/var/www/html/#{fetch(:application)}_#{fetch(:stage)}"
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/master.key')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :rvm_type, :user
set :rvm_ruby_version, '3.0.0@rails_template_6'

# Start puma once deployment is done
