gulp = require 'gulp'
server = require '../lib/server'

gulp.task 'dev', ['watch-scripts', 'watch-stylesheets'], ->
  server '_dev'
