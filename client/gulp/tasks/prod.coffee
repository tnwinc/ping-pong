gulp = require 'gulp'
open = require 'open'
server = require '../lib/server'
config = require '../lib/load-config'

deps = [
  'build-prod'
  'build-scripts'
  'build-stylesheets'
  'copy-static'
]

gulp.task 'prod', deps, ->
  server '_build', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"
