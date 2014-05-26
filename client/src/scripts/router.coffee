App = require './app'

require './index/route'
require './sites/route'

App.Router.map ->
  @resource 'sites'
