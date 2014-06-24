gulp = require 'gulp'
server = require '../lib/server'
deploy = require '../lib/deploy'

devDeps = [
  'build-dev'
  'watch-scripts'
  'watch-stylesheets'
  'watch-static'
]

gulp.task 'dev', devDeps, ->
  server '_dev'


prodDeps = [
  'build-prod'
  'build-scripts'
  'build-stylesheets'
  'copy-static'
]

gulp.task 'prod', prodDeps, ->
  server '_build'


gulp.task 'deploy', prodDeps, ->
  deploy()


gulp.task 'default', ['dev']
