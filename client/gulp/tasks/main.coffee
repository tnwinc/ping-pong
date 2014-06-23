gulp = require 'gulp'
open = require 'open'
server = require '../lib/server'
config = require '../lib/load-config'

devDeps = [
  'build-dev'
  'watch-scripts'
  'watch-stylesheets'
  'watch-static'
]

gulp.task 'dev', devDeps, ->
  server '_dev', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"

prodDeps = [
  'build-prod'
  'build-scripts'
  'build-stylesheets'
  'copy-static'
]

gulp.task 'prod', prodDeps, ->
  server '_build', (port)->
    unless config.openBrowser is false
      open "http://localhost:#{port}"

gulp.task 'default', ['dev']
