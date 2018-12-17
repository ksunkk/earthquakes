#!/usr/bin/env puma
environment ENV['RAILS_ENV'] || 'production'
pidfile "/var/www/eartquakes/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/earthquakes/shared/tmp/logs/stdout.log", "/var/www/earthquakes/shared/tmp/logs/stderr.log"
threads 2, 16
workers 2
bind "unix:///var/www/earthquakes/shared/tmp/sockets/puma.sock"
daemonize true