var isAn = require('../index');

console.log(isAn(1, 'Number.Literal'));
// true

console.log(isAn(1, 'Object'));
// false

console.log(isAn(1, 'unknown'));
// undefined
