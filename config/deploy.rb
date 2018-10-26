# config valid only for current version of Capistrano
lock "3.10.2"

server '139.59.35.69', port: 22, roles: [:web, :app, :db], primary: true

set :repo_url,        ‘<repo url>’
set :application,     "pms"
set :user,            'ubuntu' #server user

set :rvm_bin_path, "$HOME/bin"
set :rvm_ruby_version, "2.5.1@pms"

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :rails_env,       "production"
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }

set :branch,        ENV['BRANCH'] if ENV['BRANCH']

namespace :deploy do

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart'
      invoke 'deploy'
    end
  end

  set :linked_files, %w{config/database.yml}
  set :linked_dirs, %w{log}

  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
