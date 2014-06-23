Ember = require 'ember'
App = require '../app'

require './sites'

App.SitesRoute = Ember.Route.extend

  redirect: ->
    sites = @store.getValue 'sites'
    unless @store.getValue('server') and sites and sites.length
      @transitionTo 'configure'

  model: ->
    ['one', 'two', 'three']
