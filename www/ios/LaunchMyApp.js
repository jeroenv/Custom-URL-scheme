var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');

// prime it
exec(null, null, "OpenURL", "_ready", []);

var OpenURL = function() {
};

module.exports = OpenURL;