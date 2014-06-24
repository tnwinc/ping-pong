gulp = require 'gulp'
gutil = require 'gulp-util'
rev = require 'gulp-rev'
rename = require 'gulp-rename'

watchify = require 'watchify'
browserify = require 'browserify'

browserifyShim = require 'browserify-shim'
coffeeify = require 'coffeeify'
emberHbsfy = require '../lib/ember-hbsfy'
uglifyify = require 'uglifyify'

source = require 'vinyl-source-stream'
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

gulp.task 'build-scripts', ['clean'], ->
  browserify(
    entries: ['./app/router.coffee']
    extensions: ['.js', '.coffee', '.hbs']
  )
    .transform(browserifyShim)
    .transform(coffeeify)
    .transform(emberHbsfy)
    .transform({ global: true }, 'uglifyify')
    .bundle()
    .on('error', handleErrors)
    .pipe source('app.js')
    .pipe rev()
    .pipe gulp.dest('./_build/')
    .pipe rev.manifest()
    .pipe rename('scripts-manifest.json')
    .pipe gulp.dest('./_build/')
