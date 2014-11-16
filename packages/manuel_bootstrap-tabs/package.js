Package.describe({
  summary: "Tab navigation based on twitter bootstrap"
});

Package.on_use(function (api) {
  //1api.use([''], 'client');

  api.use('coffeescript', 'client');
  api.use('templating', 'client');
  api.use('underscore', 'client');
  api.use('jquery', 'client');
  api.use('deps', 'client');

  api.add_files("handlebars_helpers.coffee", "client");
  api.add_files("bootstrap_tabs.html", "client");
  api.add_files("bootstrap_tabs.coffee", "client");

  api.export('BootstrapTabs');
});