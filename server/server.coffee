request = require 'request'
express = require 'express'
bodyParser = require 'body-parser'
app = express()

app.use bodyParser()

app.get '/', (req, res)->
  res.setHeader 'Access-Control-Allow-Origin', '*'
  url = req.param 'url'

  return res.send(404) unless url

  options =
    url: url
    timeout: 10 * 1000
    strictSSL: false

  pingReq = request options, (err, pingRes)->
    if err
      return res.send 400

    res.send pingRes.statusCode

port = process.env.PORT or 3000
app.listen port, ->
  console.log "listening on #{port}"
