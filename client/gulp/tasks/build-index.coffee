gulp  = require 'gulp'
fs = require 'fs'
build = require '../lib/build-index'

gulp.task 'dev-index', ->
  gulp.src 'app/index.hbs'
    .pipe build(['app.js'], ['app.css'])
    .pipe gulp.dest('./_dev/')

scriptsManifest = '_build/scripts-manifest.json'
stylesheetsManifest = '_build/stylesheets-manifest.json'

gulp.task 'prod-index', ['build-scripts', 'build-stylesheets'], ->
  scriptName = JSON.parse(fs.readFileSync(scriptsManifest))['app.js']
  stylesheetName = JSON.parse(fs.readFileSync(stylesheetsManifest))['app.css']
  fs.unlinkSync scriptsManifest
  fs.unlinkSync stylesheetsManifest

  gulp.src 'app/index.hbs'
    .pipe build([scriptName], [stylesheetName])
    .pipe gulp.dest('./_build/')
