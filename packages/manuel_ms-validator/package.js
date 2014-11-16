Package.describe({
  summary: "A blog system for meteor"
});

Npm.depends({validator: "3.2.0"});

Package.on_use(function(api){
  var both = ['client', 'server'];

  api.use([
    'coffeescript',
    'underscore'
  ], both);

  // Client Files
  api.add_files([
    'ms_validator.coffee',
    'lib/validate.js'
  ], both);
});