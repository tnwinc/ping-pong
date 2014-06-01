gulp = require 'gulp'
open = require 'open'
server = require '../lib/server'
config = require '../lib/load-config'

gulp.task 'dev', ['watch-scripts', 'watch-stylesheets'], ->
  server '_dev', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"
