Ember = require 'ember'
App = require '../app'

require './sites'
require './controller'
require './model'
require './view'

App.SitesRoute = Ember.Route.extend

  redirect: (model)->
    unless model.get('server') and model.get('sites').length
      @transitionTo 'sites.edit'

  model: ->
    App.Site.create
      server: @store.getValue 'server'
      sites: App.Site.deserialize (@store.getValue('sites') or [])

  setupController: (controller, model)->
    @_super controller, model

    @_monitorSiteAvailability()

  _monitorSiteAvailability: ->
    @_pingSites()
    setInterval @_pingSites.bind(this), 5000

  _pingSites: ->
    model = @modelFor 'sites'
    server = model.get 'server'
    sites = model.get('sites') or []
    sites.forEach (site)=>
      return unless url = site.get 'url'

      @pinger.ping server, url
        .then -> site.set 'available', true
        .catch -> site.set 'available', false
