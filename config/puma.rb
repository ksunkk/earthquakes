#!/usr/bin/env puma
environment ENV['RAILS_ENV'] || 'production'
pidfile "/var/www/admin/current/tmp/pids/puma.pid"
stdout_redirect "/var/www/earthquakes/current/tmp/log/stdout", "/var/www/earthquakes/current/tmp/log/stderr"
threads 2, 16
workers 2
bind "unix:///var/www/earthquakes/current/tmp/sockets/puma.sock"
daemonize true