gulp = require 'gulp'
open = require 'open'
server = require '../lib/server'
config = require '../lib/load-config'

devTasks = [
  'build-dev-index'
  'watch-scripts'
  'watch-stylesheets'
  'watch-static'
]

gulp.task 'dev', devTasks, ->
  server '_dev', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"
