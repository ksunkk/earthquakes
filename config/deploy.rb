# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"


set :application, "eartquakes"
set :repo_url, "git@github.com:ksunkk/earthquakes.git"
set :use_sudo, true
# set :whenever_command, "bundle exec whenever"