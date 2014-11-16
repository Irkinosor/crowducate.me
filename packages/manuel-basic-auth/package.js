Package.describe({
  summary: "Basic http auth for any route"
});

Npm.depends({connect: "2.9.0"});

Package.on_use(function (api) {
  //api.use([''], 'server');

  api.export && api.export('BasicAuth');

  api.add_files('basic_auth.js', 'server');
});