Ember = require 'ember'
App = require '../app'

App.SitesController = Ember.ObjectController.extend

  actions:

    edit: ->
      @transitionToRoute 'sites.edit'
