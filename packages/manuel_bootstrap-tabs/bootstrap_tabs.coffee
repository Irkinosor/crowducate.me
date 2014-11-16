BootstrapTabs =
  templates: {}
  active: ''
  _deps: new Deps.Dependency

  getCurrentTab: ->
    @_deps.depend()
    return @active;

  setCurrentTab: (value) ->
    return if value is @active
    @active = value
    @_deps.changed()

@BootstrapTabs = BootstrapTabs

Template.bootstrapTabsMenu.created = ->
  BootstrapTabs.setCurrentTab(@data.default) unless BootstrapTabs.active

Template.bootstrapTabsMenu.helpers({
  renderActiveTemplate: ->
    active = BootstrapTabs.getCurrentTab()
    activeOption = _.findWhere(@tabItems, {key: active})
    _.extend(@, activeOption.data)
    Template[activeOption.template]
})

Template.bootstrapTabsMenuItem.helpers({
  active: ->
    return 'active' if @key is BootstrapTabs.getCurrentTab()
})

Template.bootstrapTabsMenuItem.events({
  'click .change-tab': (evt, tpl) ->
    evt.preventDefault()

    BootstrapTabs.setCurrentTab($(evt.target).attr('data-tab'))

})
