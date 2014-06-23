Ember = require 'ember'
App = require '../app'

require './sites'
require './model'

App.SitesRoute = Ember.Route.extend

  redirect: (model)->
    unless model.get('server') and model.get('sites').length
      @transitionTo 'sites.edit'

  model: ->
    App.Site.create
      server: @store.getValue 'server'
      sites: App.Site.deserialize (@store.getValue('sites') or [])
