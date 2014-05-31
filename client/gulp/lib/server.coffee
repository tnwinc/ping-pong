connect = require 'connect'
gutil = require 'gulp-util'

module.exports = (dir)->

  staticContent = connect.static "#{process.cwd()}/#{dir}"
  server = connect.createServer(staticContent).listen 0
  server.on 'listening', ->
    url = "http://localhost:#{server.address().port}"
    gutil.log "listening on #{gutil.colors.yellow url}..."
