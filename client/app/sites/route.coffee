Ember = require 'ember'
App = require '../app'

require '../sites/sites'

App.SitesRoute = Ember.Route.extend

  model: ->
    ['one', 'two', 'three']
