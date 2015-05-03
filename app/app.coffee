angular = require('angular')

loadContext = (contextRequire)->
  contextRequire.keys().forEach (mod)-> contextRequire(mod)


loadContext(require.context('./home', true, /.*/))

app = angular.module 'app', [
  'home'
]


app.run ($rootScope)->

  $rootScope.blah = 'foo'
