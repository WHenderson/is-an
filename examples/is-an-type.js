var isAn = require('../index');

console.log(isAn.Number(1));
// true

console.log(isAn.Number.Literal(new Number(1)));
// false

console.log(isAn.Object(1));
// false
