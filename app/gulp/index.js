'use strict';

var fs = require('fs');
var onlyScripts = require('./util/scriptFilter');

const tasks = fs.readdirSync('./gulp/tasks/').filter(onlyScripts);

tasks.forEach((task) => {
  require('./tasks/' + task);
});
