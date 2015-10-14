typeIs = require('../index')

x = (function () { return arguments; })();
console.log('type name:', typeIs(x))
console.log('is regexp:', typeIs.RegExp(x))
