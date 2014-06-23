Ember = require 'ember'
App = require '../app'

require './sites.edit'
require './controller'
require './view'

App.SitesEditRoute = Ember.Route.extend

  model: ->
    @modelFor 'sites'
