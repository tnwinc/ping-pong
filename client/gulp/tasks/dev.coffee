gulp = require 'gulp'
open = require 'open'
server = require '../lib/server'
config = require '../lib/load-config'

deps = [
  'build-dev'
  'watch-scripts'
  'watch-stylesheets'
  'watch-static'
]

gulp.task 'dev', deps, ->
  server '_dev', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"
