gulp = require 'gulp'
deploy = require '../lib/deploy'

gulp.task 'deploy', ->
  deploy()
