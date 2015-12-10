# config valid only for current version of Capistrano
lock '3.4.0'

app_name='seven'
user='root'
set :application, app_name
set :user, user
set :repo_url, 'git@github.com:Utvecklarkollektivet/seven.git'
set :deploy_to, '/var/www/seven'
set :scm, :git
set :format, :pretty
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy

set :foreman_use_sudo, false # Set to :rbenv for rbenv sudo, :rvm for rvmsudo or true for normal sudo
set :foreman_roles, :all
set :foreman_template, 'upstart'
set :foreman_export_path, ->{ File.join(Dir.home, '.init') }
set :foreman_options, ->{ {
  app: application,
    log: File.join(shared_path, 'log')
  }
}

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
