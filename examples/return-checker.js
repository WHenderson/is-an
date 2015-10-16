var isAn = require('../index');

console.log(isAn.Number.Literal == isAn('Number.Literal', { returnChecker: true }));
// true
