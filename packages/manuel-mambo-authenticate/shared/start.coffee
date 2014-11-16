AccountsEntry =
  settings:
    wrapLinks: true
    homeRoute: 'home'
    dashboardRoute: 'dashboard'
    i18n: {}

  config: (appConfig) ->
    @settings = _.extend(@settings, appConfig)

  i18n: (key) ->
    if @settings.i18n[key] then return @settings.i18n[key] else return key

@AccountsEntry = AccountsEntry

Handlebars.registerHelper 'capitalize', (str) ->
  str.charAt(0).toUpperCase() + str.slice(1)

Handlebars.registerHelper 'signupClass', ->
  if Accounts.oauth && Accounts.oauth.serviceNames().length > 0
    "collapse"

Handlebars.registerHelper 'otherLoginServices', ->
  Accounts.oauth &&
  Accounts.oauth.serviceNames().length > 0

Handlebars.registerHelper 'loginServices', ->
  Accounts.oauth.serviceNames()
