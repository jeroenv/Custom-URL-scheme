var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');

// prime it
cordova.exec(null, null, "OpenURL");

var OpenURL = function() {
};

module.exports = OpenURL;