gulp = require 'gulp'
build = require '../lib/build-index'

gulp.task 'build-dev-index', ->
  gulp.src('src/index.hbs')
    .pipe build(['app.js'], ['app.css'])
    .pipe gulp.dest('./_dev/')
