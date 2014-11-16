;(function () {

  var connect = Npm.require('connect');

  if ('undefined' === typeof BasicAuth){
    BasicAuth = {};
  }

  BasicAuth.init = function () {
    if(!Meteor.settings.basicAuth){
      return console.log('Basicauth init but no basicAuth in Meteor.settings found');
    }
    WebApp.connectHandlers.use(connect.basicAuth(Meteor.settings.basicAuth.name, Meteor.settings.basicAuth.password));
    basicAuth = WebApp.connectHandlers.stack.pop();
    WebApp.connectHandlers.stack.unshift(basicAuth);
  };
  
  

}());