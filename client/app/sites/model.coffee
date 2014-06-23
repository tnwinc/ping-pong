Ember = require 'ember'
App = require '../app'

App.Site = Ember.Object.extend

  displayName: (->
    (@get('name') || '').trim() or @get 'url'
  ).property 'name', 'url'

  serialize: ->
    name: @get 'name'
    url: @get 'url'

App.Site.reopenClass

  serialize: (sites)->
    sites.map (site)-> site.serialize()

  deserialize: (sites)->
    sites.map (site)-> App.Site.create site

  newOne: ->
    App.Site.create name: '', url: ''
