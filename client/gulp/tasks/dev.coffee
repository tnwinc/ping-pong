gulp = require 'gulp'
es = require 'event-stream'
through = require 'through2'
open = require 'open'
server = require '../lib/server'
config = require '../lib/load-config'

gulp.task 'dev', ['build-dev', 'watch-scripts', 'watch-stylesheets', 'watch-static'], ->

  server '_dev', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"
