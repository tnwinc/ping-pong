gulp = require 'gulp'
open = require 'open'
server = require '../lib/server'
config = require '../lib/load-config'

prodTasks = [
  # 'build-prod-index'
  # 'build-scripts'
  # 'build-stylesheets'
  'copy-static'
]

gulp.task 'prod', prodTasks, ->
  server '_build', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"
