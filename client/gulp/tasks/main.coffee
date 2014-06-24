gulp = require 'gulp'
server = require '../lib/server'
deploy = require '../lib/deploy'

devDeps = [
  'watch-scripts'
  'watch-stylesheets'
  'watch-static'
  'dev-index'
]

gulp.task 'dev', devDeps, ->
  server '_dev'


prodDeps = [
  'build-scripts'
  'build-stylesheets'
  'copy-static'
  'prod-index'
]

gulp.task 'build', prodDeps

gulp.task 'prod', ['build'], ->
  server '_build'

gulp.task 'deploy', ['build'], ->
  deploy()


gulp.task 'default', ['dev']

