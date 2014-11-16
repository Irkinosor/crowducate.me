Package.describe({
  summary: "Google Analytics support"
});

//Npm.depends({moment: "2.4.0"});

Package.on_use(function (api) {
  api.use(['coffeescript', 'underscore'], 'client');

  if(api.export){
    api.export('GAnalytics', 'client');
  }
  api.add_files("ganalytics.coffee", ["client"]);
});