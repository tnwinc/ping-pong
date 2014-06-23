Ember = require 'ember'
App = require '../app'

require '../sites/model'

App.SitesEditController = Ember.ObjectController.extend

  actions:

    addSite: ->
      @get('sites').addObject App.Site.newOne()

    removeSite: (site)->
      @get('sites').removeObject site

    save: ->
      @store.updateValue 'server', @get('server')
      @store.updateValue 'sites', App.Site.serialize(@get 'sites')
