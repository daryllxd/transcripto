# frozen_string_literal: true
require 'net/ssh/proxy/command'

# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'transcripto'
set :repo_url, 'git@github.com:sourcepad/transcripto-backend.git'
set :deploy_via, :remote_cache
set :bundle_without, [:development, :test]

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto
set :linked_files, %w(config/database.yml config/secrets.yml)

set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets config/thin)

# Default value for :pty is false
# set :pty, true

set :log_level, :debug

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  after :publishing, :restart
end
