is = require('../index')

x = (function () { return arguments; })();
console.log('type name:', is(x))
console.log('is regexp:', is.RegExp(x))
