gulp = require 'gulp'
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
stylus = require 'gulp-stylus'
handleErrors = require '../lib/handle-errors'

compile = ->
  gulp.src 'app/app.styl'
    .pipe plumber()
    .pipe stylus(errors: true).on('error', handleErrors)
    .pipe gulp.dest('./_dev/')

module.exports =

  watch: ->
    watch glob: 'app/**/*.styl', ->
      compile()
    compile()
