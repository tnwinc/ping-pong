gulp = require 'gulp'
watch = require 'gulp-watch'

module.exports =

  watch: ->
    watch(glob: 'static/**/*').pipe(gulp.dest '_dev')

  copy: ->
    gulp.src('static/**/*').pipe(gulp.dest '_build')
