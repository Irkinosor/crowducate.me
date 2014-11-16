Package.describe({
  summary: "Moment.js for time stuff"
});

Npm.depends({moment: "2.4.0"});

Package.on_use(function (api) {
  if(api.export){
    api.export('moment', 'server');
  }
  api.add_files("moment.js", ["server"]);
  api.add_files(".npm/package/node_modules/moment/moment.js", ["client"]);
});