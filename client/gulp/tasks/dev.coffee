gulp = require 'gulp'
server = require '../lib/server'

gulp.task 'dev', ['watch-scripts'], ->
  server '_dev'
