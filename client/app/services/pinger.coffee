Ember = require 'ember'
$ = require 'jquery'
App = require '../app'

Pinger = Ember.Object.extend

  ping: (server, url)->
    new Ember.RSVP.Promise (resolve, reject)->
      $.get server, url: url
        .done (result)-> resolve()
        .fail (result)-> reject()

Ember.Application.initializer
  name: 'pinger'

  initialize: (container)->
    container.register 'pinger:main', Pinger

Ember.Application.initializer
  name: 'injectPinger'
  before: 'pinger'

  initialize: (container, application)->
    application.inject 'route', 'pinger', 'pinger:main'
