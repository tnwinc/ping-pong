Ember = require 'ember'
App = require '../app'

require './configure'

App.ConfigureRoute = Ember.Route.extend

  model: ->
    server: @store.getValue 'server'
    sites: @store.getValue 'sites'
