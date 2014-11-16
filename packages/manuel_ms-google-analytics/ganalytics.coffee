load = (i, s, o, g, r, a, m) ->
  i["GoogleAnalyticsObject"] = r
  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
  i[r].l = 1 * new Date()
  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]
  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m

GAnalytics =
  enabled: false

  setEnabled: (value) ->
    @enabled = value

  pageview: (pageLocation) ->
    return unless @enabled
    pageLocation = window.location.pathname unless pageLocation
    ga('send', 'pageview', pageLocation)

  event: (category, action, label, value) ->
    return unless @enabled
    ga('send', 'event', category, action, label, value)


@GAnalytics = GAnalytics

if Meteor.settings and Meteor.settings.public and Meteor.settings.public.ganalytics and Meteor.settings.public.ganalytics.key
  load(window, document, 'script', '//www.google-analytics.com/analytics.js','ga')

  gaSettings = Meteor.settings.public.ganalytics
  gaConfig = {}
  gaConfig.cookieName = gaSettings.cookieName unless _.isUndefined(gaSettings.cookieName)
  gaConfig.cookieDomain = gaSettings.cookieDomain unless _.isUndefined(gaSettings.cookieDomain)
  gaConfig.cookieExpires = gaSettings.cookieExpires unless _.isUndefined(gaSettings.cookieExpires)

  gaConfig = 'auto' if Object.keys(gaConfig).length is 0

  ga('create', gaSettings.key, gaConfig)
  ga('set', 'anonymizeIp', true) if gaSettings.anonymizeIp

  GAnalytics.setEnabled(true)
else
  console.log 'Ganalytics missing in public settings'