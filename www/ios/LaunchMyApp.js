var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');

// prime it
cordova.exec(null, null, "LaunchMyApp");

var LaunchMyApp = function() {
};

module.exports = LaunchMyApp;