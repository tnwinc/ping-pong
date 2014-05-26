gulp = require 'gulp'
gutil = require 'gulp-util'
watchify = require 'watchify'
browserifyShim = require 'browserify-shim'
coffeeify = require 'coffeeify'
emberHbsfy = require './lib/ember-hbsfy'
source = require 'vinyl-source-stream'

bundle = (bundler)->
  bundler.bundle()
    .pipe source('bundle.js')
    .pipe gulp.dest('./_dev/')

gulp.task 'dev', ->
  bundler = watchify
    entries: ['./src/scripts/router.coffee']
    extensions: ['.js', '.coffee', '.hbs']

  bundler.transform(browserifyShim)
    .transform(coffeeify)
    .transform(emberHbsfy)
  bundle bundler

  rebundle = (files)->
    for file in files
      gutil.log gutil.colors.cyan('rebundle'), file.replace process.cwd(), ''
    bundle bundler

  bundler.on 'error', gutil.log
  bundler.on 'update', rebundle

  rebundle
