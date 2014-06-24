Ember = require 'ember'

module.exports = Ember.Object.extend

  run: ->
    new Ember.RSVP.Promise (resolve)=>
      @get('store').save 'sites', @_getOldSites()

      resolve()

  _getOldSites: ->
    index = 0
    sites = []
    site = localStorage['ping_pong_' + index]
    while site
      try
        parsedSite = JSON.parse site
      catch
        parsedSite = name: site, url: site
      sites.push parsedSite
      delete localStorage['ping_pong_' + index]
      index++
      site = localStorage['ping_pong_' + index]

    sites
