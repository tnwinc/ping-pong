gulp = require 'gulp'
es = require 'event-stream'
through = require 'through2'
open = require 'open'
build = require '../lib/build-index'
scripts = require '../lib/scripts'
stylesheets = require '../lib/stylesheets'
staticAssets = require '../lib/static'
server = require '../lib/server'
config = require '../lib/load-config'

gulp.task 'dev', ->

  deps = [
    build.dev()
    # scripts.watch()
    # stylesheets.watch()
    # staticAssets.watch()
  ]

  es.merge(deps).pipe through.obj null, ->
    server '_dev', (port)->
      unless config.openBrowser is false
        open "http://localhost:#{port}"
