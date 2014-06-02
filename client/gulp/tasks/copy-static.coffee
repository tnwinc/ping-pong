gulp = require 'gulp'
watch = require 'gulp-watch'

gulp.task 'watch-static', ->
  watch(glob: 'static/**/*').pipe(gulp.dest '_dev')
  return
