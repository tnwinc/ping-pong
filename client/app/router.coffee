App = require './app'

require './services/store'

require './index/route'
require './sites/route'
require './configure/route'

App.Router.map ->
  @resource 'sites'
  @route 'configure'
