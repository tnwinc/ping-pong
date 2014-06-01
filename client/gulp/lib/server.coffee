connect = require 'connect'
portfinder = require 'portfinder'
gutil = require 'gulp-util'

module.exports = (dir)->

  portfinder.getPort (err, port)->
    connect
      .createServer connect.static "#{process.cwd()}/#{dir}"
      .listen port, ->
        url = "http://localhost:#{port}"
        gutil.log "listening on #{gutil.colors.yellow url}..."
