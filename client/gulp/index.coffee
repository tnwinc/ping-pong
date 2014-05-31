tasks = require('fs').readdirSync './gulp/tasks/'

require "./tasks/#{task}" for task in tasks
