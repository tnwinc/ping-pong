gulp = require 'gulp'
clean = require 'gulp-clean'

gulp.task 'clean', ->
  gulp.src('_dev', read: false).pipe clean()
