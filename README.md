# is-an
Robust and comprehensive type checking library for node and the browser

[![Build Status](https://travis-ci.org/WHenderson/is-an.svg?branch=master)](https://travis-ci.org/WHenderson/is-an)
[![Coverage Status](https://coveralls.io/repos/WHenderson/is-an/badge.svg?branch=master&service=github)](https://coveralls.io/github/WHenderson/is-an?branch=master)

## Installation

### Node
    npm install is-an

### Web
    bower install is-an

## Usage

### node
```js
var is = require('is-an');

console.log('is number?', is.Number(1));
// is number? true
```

### web (global)
```html
<html>
    <head>
        <script type="text/javascript" src="is-an.web.min.js"></script>
    </head>
    <body>
        <script>
            console.log('is number?', is.Number(1));
            // is number? true
        </script>
    </body>
</html>
```

### web (amd)
```js
require.config({
  paths: {
      "is-an": "is-an.web.min.js"
  }
});
require(['is-an'], function (is) {
    console.log('is number?', is.Number(1));
    // is number? true
});
```

## API

### [`isAn(value) -> String`](examples/type-name.js)
Returns the basic type representation of `value`.

```js
console.log(isAn(1));
// Number

console.log(isAn({}));
// Object
```

### [`isAn(typeName : String, { returnChecker: true }) -> Function`](examples/return-checker.js)
Returns the type checking function for `typeName`.

```js
console.log(isAn.Number.Literal == isAn('Number.Literal', { returnChecker: true }));
// true
```

### [`isAn(value, typeName : String) -> Boolean`](examples/is-an.js)
Returns `true` iff `value` is of type `typeName`.
Identical to the below methods.

```js
console.log(isAn(1, 'Number.Literal'));
// true

console.log(isAn(1, 'Object'));
// false

console.log(isAn(1, 'unknown'));
// undefined
```

### [`isAn.<typeName>(value) -> Boolean`](examples/is-an-type.js)
Returns `true` iff `value` is of the type `typeName`.

```js
console.log(isAn.Number(1));
// true

console.log(isAn.Number.Literal(new Number(1)));
// false

console.log(isAn.Object(1));
// false
```

### [`isAn.<typeName>.typeName : String`](examples/type-name-property.js)
A simple property which contains the distinguished type name of the function.

```js
console.log(isAn.Number.Integer.typeName);
// Number.Integer

console.log(isAn.Object.typeName);
// Object
```

## Complete list of supported type checking methods

The tables linked below display the results of running all defined inputs against all type checks, with irrelevent results filtered.
Type checks not shown return false for the given input.

See the [complete results table](test/fixtures/complete.md) for a combined listing.

* [`isAn.Undefined(x)`](test/fixtures/Undefined.md)
* [`isAn.Null(x)`](test/fixtures/Null.md)
* [`isAn.Boolean(x)`](test/fixtures/Boolean.md)
* [`isAn.Boolean.Literal(x)`](test/fixtures/Boolean.md)
* [`isAn.Boolean.Object(x)`](test/fixtures/Boolean.md)
* [`isAn.Number(x)`](test/fixtures/Number.md)
* [`isAn.Number.Literal(x)`](test/fixtures/Number.md)
* [`isAn.Number.Literal.NaN(x)`](test/fixtures/Number.md)
* [`isAn.Number.Literal.Finite(x)`](test/fixtures/Number.md)
* [`isAn.Number.Literal.Infinite(x)`](test/fixtures/Number.md)
* [`isAn.Number.Literal.Integer(x)`](test/fixtures/Number.md)
* [`isAn.Number.Object(x)`](test/fixtures/Number.md)
* [`isAn.Number.Object.NaN(x)`](test/fixtures/Number.md)
* [`isAn.Number.Object.Finite(x)`](test/fixtures/Number.md)
* [`isAn.Number.Object.Infinite(x)`](test/fixtures/Number.md)
* [`isAn.Number.Object.Integer(x)`](test/fixtures/Number.md)
* [`isAn.Number.NaN(x)`](test/fixtures/Number.md)
* [`isAn.Number.Finite(x)`](test/fixtures/Number.md)
* [`isAn.Number.Infinite(x)`](test/fixtures/Number.md)
* [`isAn.Number.Integer(x)`](test/fixtures/Number.md)
* [`isAn.String(x)`](test/fixtures/String.md)
* [`isAn.String.Literal(x)`](test/fixtures/String.md)
* [`isAn.String.Object(x)`](test/fixtures/String.md)
* [`isAn.Array(x)`](test/fixtures/Array.md)
* [`isAn.Object(x)`](test/fixtures/Object.md)
* [`isAn.Object.Literal(x)`](test/fixtures/Object.md)
* [`isAn.Function(x)`](test/fixtures/Function.md)
* [`isAn.Arguments(x)`](test/fixtures/Arguments.md)
* [`isAn.Date(x)`](test/fixtures/Date.md)
* [`isAn.RegExp(x)`](test/fixtures/RegExp.md)
* [`isAn.Error(x)`](test/fixtures/Error.md)
* [`isAn.Math(x)`](test/fixtures/Math.md)
* [`isAn.Int8Array(x)`](test/fixtures/Int8Array.md)
* [`isAn.Uint8ClampedArray(x)`](test/fixtures/Uint8ClampedArray.md)
* [`isAn.Uint8Array(x)`](test/fixtures/Uint8Array.md)
* [`isAn.Int16Array(x)`](test/fixtures/Int16Array.md)
* [`isAn.Uint16Array(x)`](test/fixtures/Uint16Array.md)
* [`isAn.Int32Array(x)`](test/fixtures/Int32Array.md)
* [`isAn.Uint32Array(x)`](test/fixtures/Uint32Array.md)
* [`isAn.Float32Array(x)`](test/fixtures/Float32Array.md)
* [`isAn.Float64Array(x)`](test/fixtures/Float64Array.md)



