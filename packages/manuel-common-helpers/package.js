Package.describe({
  summary: "Helpers i use very often"
});

Package.on_use(function (api) {

  api.use('jquery', 'client');
  api.use('templating', 'client');
  api.use('coffeescript', ['client', 'server']);

  if (typeof api.export != 'undefined') {
    api.export('Etc');
  }

  api.add_files("etc_common.coffee", ['client', 'server']);
  api.add_files("etc_server.coffee", "server");
  api.add_files("etc_client.js", "client");
  api.add_files("serialize_object.js", "client");
  api.add_files("handlebars_helpers.coffee", "client");
});
