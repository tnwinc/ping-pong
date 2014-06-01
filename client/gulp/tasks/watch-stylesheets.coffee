gulp = require 'gulp'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
stylus = require 'gulp-stylus'

gulp.task 'watch-stylesheets', ->
  watch glob: 'app/**/*.styl', ->
    gulp.src 'app/app.styl'
      .pipe plumber()
      .pipe stylus(errors: true)
      .pipe gulp.dest('./_dev/')
  return
