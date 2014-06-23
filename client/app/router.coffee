App = require './app'

require './services/store'
require './services/pinger'

require './index/route'
require './sites/route'
require './edit/route'

App.Router.map ->
  @resource 'sites', ->
    @route 'edit'
