Handlebars.registerHelper('ifEquals', (a, b) ->
  return a is b
)


Handlebars.registerHelper('activeByRouteName', (routeName) ->
  return 'active' if Router.current().route.name is routeName
)