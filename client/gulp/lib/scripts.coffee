gulp = require 'gulp'
gutil = require 'gulp-util'

watchify = require 'watchify'
browserify = require 'browserify'

browserifyShim = require 'browserify-shim'
coffeeify = require 'coffeeify'
emberHbsfy = require '../lib/ember-hbsfy'

gulpif = require 'gulp-if'
source = require 'vinyl-source-stream'
handleErrors = require '../lib/handle-errors'

bundle = (bundler, destination)->
  isDev = destination is '_dev'
  bundler
    .bundle()
    .on('error', handleErrors)
    .pipe source('app.js')
    .pipe gulpif(isDev, gulp.dest("./#{destination}/"))

setupBundler = (bundlify, destination)->
  bundler = bundlify
    entries: ['./app/router.coffee']
    extensions: ['.js', '.coffee', '.hbs']

  bundler
    .transform(browserifyShim)
    .transform(coffeeify)
    .transform(emberHbsfy)
  bundle bundler, destination

  bundler

module.exports =

  watch: ->
    destination = '_dev'
    bundler = setupBundler watchify, destination

    rebundle = (files)->
      for file in files
        gutil.log gutil.colors.cyan('rebundle'), file.replace process.cwd(), ''
      bundle bundler, destination

    bundler.on 'update', rebundle

    rebundle()
