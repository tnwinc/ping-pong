gulp = require 'gulp'
gutil = require 'gulp-util'
watchify = require 'watchify'
browserifyShim = require 'browserify-shim'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'
emberHbsfy = require '../lib/ember-hbsfy'
handleErrors = require '../lib/handle-errors'

bundle = (bundler)->
  bundler
    .bundle()
    .on('error', handleErrors)
    .pipe source('app.js')
    .pipe gulp.dest('./_dev/')

gulp.task 'watch-scripts', ->
  bundler = watchify
    entries: ['./app/router.coffee']
    extensions: ['.js', '.coffee', '.hbs']

  bundler
    .transform(browserifyShim)
    .transform(coffeeify)
    .transform(emberHbsfy)
  bundle bundler

  rebundle = (files)->
    for file in files
      gutil.log gutil.colors.cyan('rebundle'), file.replace process.cwd(), ''
    bundle bundler

  bundler.on 'update', rebundle

  rebundle
