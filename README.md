# type-is
Robust and comprehensive type checking library for node and the browser

## Installation

### Node
    npm install type-is

### Web
    bower install type-is

## Usage

### node
```js
var typeIs = require('type-is');

console.log('is number?', typeIs.Number(1));
// is number? true
```

### web (global)
```html
<html>
    <head>
        <script type="text/javascript" src="type-is.web.min.js"></script>
    </head>
    <body>
        <script>
            console.log('is number?', typeIs.Number(1));
            // is number? true
        </script>
    </body>
</html>
```

### web (amd)
```js
require.config({
  paths: {
      "type-is": "type-is.web.min.js"
  }
});
require(['type-is'], function (typeIs) {
    console.log('is number?', typeIs.Number(1));
    // is number? true
});
```

## API

### methods

### [`(value) -> typeName`](examples/typeName.js)
Returns a string representing the basic type of the provided value.

### [`(value, typeName) -> Boolean`](examples/typeName.js)
Returns a true iff the base type of `value` matches `typeName`.

### [`.<TypeName>(value) -> Boolean`](examples/typeIs.js)
Returns true iff `value` is of type `TypeName`.

Supported types

* `.Undefined(value) -> Boolean`
* `.Null(value) -> Boolean`
* `.Boolean(value) -> Boolean`
* `.Number(value) -> Boolean`
* `.String(value) -> Boolean`
* `.Array(value) -> Boolean`
* `.Object(value) -> Boolean`
* `.Function(value) -> Boolean`
* `.Arguments(value) -> Boolean`
* `.Date(value) -> Boolean`
* `.RegExp(value) -> Boolean`
* `.Error(value) -> Boolean`
* `.Math(value) -> Boolean`
* `.Int8Array(value) -> Boolean`
* `.Uint8ClampedArray(value) -> Boolean`
* `.Uint8Array(value) -> Boolean`
* `.Int16Array(value) -> Boolean`
* `.Uint16Array(value) -> Boolean`
* `.Int32Array(value) -> Boolean`
* `.Uint32Array(value) -> Boolean`
* `.Float32Array(value) -> Boolean`
* `.Float64Array(value) -> Boolean`

### [`.<TypeName>.Literal(value) -> Boolean`](examples/literal.js)
Returns true iff `value` is a literal of type `TypeName`.

Supported types

* `.Boolean.Literal(value) -> Boolean`
* `.Number.Literal(value) -> Boolean`
* `.String.Literal(value) -> Boolean`
* `.Object.Literal(value) -> Boolean`

### [.Number](examples/number.js)
Numbers support the following additional checks

* `.Number.Integer(value) -> Boolean`

* `.Number.NaN(value) -> Boolean`
* `.Number.Primitive.NaN(value) -> Boolean`

* `.Number.Finite(value) -> Boolean`
* `.Number.Primitive.Finite(value) -> Boolean`

* `.Number.Infinite(value) -> Boolean`
* `.Number.Primitive.Infinite(value) -> Boolean`

## Results grid

javascript                               | type name             | `Undefined`   | `Null`   | `Boolean`   | `Boolean.Literal`   | `Number`   | `Number.Literal`   | `Number.Literal.NaN`   | `Number.Literal.Finite`   | `Number.Literal.Infinite`   | `Number.NaN`   | `Number.Finite`   | `Number.Infinite`   | `Number.Integer`   | `String`   | `String.Literal`   | `Array`   | `Object`   | `Object.literal`   | `Function`   | `Arguments`   | `Date`   | `RegExp`   | `Error`   | `Math`   | `Int8Array`   | `Uint8ClampedArray`   | `Uint8Array`   | `Int16Array`   | `Uint16Array`   | `Int32Array`   | `Uint32Array`   | `Float32Array`   | `Float64Array`
-----------------------------------------|-----------------------|---------------|----------|-------------|---------------------|------------|--------------------|------------------------|---------------------------|-----------------------------|----------------|-------------------|---------------------|--------------------|------------|--------------------|-----------|------------|--------------------|--------------|---------------|----------|------------|-----------|----------|---------------|-----------------------|----------------|----------------|-----------------|----------------|-----------------|------------------|-----------------
`void 0`                                 | `Undefined`           | TRUE          |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`undefined`                              | `Undefined`           | TRUE          |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`null`                                   | `Null`                |               | TRUE     |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`true`                                   | `Boolean`             |               |          | TRUE        | TRUE                |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`false`                                  | `Boolean`             |               |          | TRUE        | TRUE                |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Boolean(true)`                      | `Boolean`             |               |          | TRUE        |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Boolean(false)`                     | `Boolean`             |               |          | TRUE        |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Boolean()`                          | `Boolean`             |               |          | TRUE        |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`0`                                      | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        | TRUE                      |                             |                | TRUE              |                     | TRUE               |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`1`                                      | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        | TRUE                      |                             |                | TRUE              |                     | TRUE               |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`1.0`                                    | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        | TRUE                      |                             |                | TRUE              |                     | TRUE               |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`1.5`                                    | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        | TRUE                      |                             |                | TRUE              |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`0.1 * 0.2`                              | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        | TRUE                      |                             |                | TRUE              |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`0.1 + 0.2`                              | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        | TRUE                      |                             |                | TRUE              |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`Infinity`                               | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        |                           | TRUE                        |                |                   | TRUE                |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`-Infinity`                              | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        |                           | TRUE                        |                |                   | TRUE                |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`NaN`                                    | `Number`              |               |          |             |                     | TRUE       | TRUE               | TRUE                   |                           |                             | TRUE           |                   |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`Number.NEGATIVE_INFINITY`               | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        |                           | TRUE                        |                |                   | TRUE                |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`Number.POSITIVE_INFINITY`               | `Number`              |               |          |             |                     | TRUE       | TRUE               |                        |                           | TRUE                        |                |                   | TRUE                |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`Number.NaN`                             | `Number`              |               |          |             |                     | TRUE       | TRUE               | TRUE                   |                           |                             | TRUE           |                   |                     |                    |            |                    |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Number()`                           | `Number`              |               |          |             |                     | TRUE       |                    |                        |                           |                             |                | TRUE              |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Number(1)`                          | `Number`              |               |          |             |                     | TRUE       |                    |                        |                           |                             |                | TRUE              |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Number(1.5)`                        | `Number`              |               |          |             |                     | TRUE       |                    |                        |                           |                             |                | TRUE              |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Number(Number.NaN)`                 | `Number`              |               |          |             |                     | TRUE       |                    |                        |                           |                             | TRUE           |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Number(Number.NEGATIVE_INFINITY)`   | `Number`              |               |          |             |                     | TRUE       |                    |                        |                           |                             |                |                   | TRUE                |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Number(Number.POSITIVE_INFINITY)`   | `Number`              |               |          |             |                     | TRUE       |                    |                        |                           |                             |                |                   | TRUE                |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`'s'`                                    | `String`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    | TRUE       | TRUE               |           |            |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new String('s')`                        | `String`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    | TRUE       |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new String()`                           | `String`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    | TRUE       |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`[]`                                     | `Array`               |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    | TRUE      | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Array()`                            | `Array`               |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    | TRUE      | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Array(1)`                           | `Array`               |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    | TRUE      | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`Array(1)`                               | `Array`               |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    | TRUE      | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`{}`                                     | `Object`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       | TRUE               |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Object()`                           | `Object`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       | TRUE               |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Object({})`                         | `Object`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       | TRUE               |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Base()`                             | `Object`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Derived()`                          | `Object`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`function() {}`                          | `Function`            |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           |            |                    | TRUE         |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`function f () {}`                       | `Function`            |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           |            |                    | TRUE         |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`arguments`                              | `Arguments`           |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              | TRUE          |          |            |           |          |               |                       |                |                |                 |                |                 |                  |
`new Date()`                             | `Date`                |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               | TRUE     |            |           |          |               |                       |                |                |                 |                |                 |                  |
`/a/`                                    | `RegExp`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          | TRUE       |           |          |               |                       |                |                |                 |                |                 |                  |
`new RegExp()`                           | `RegExp`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          | TRUE       |           |          |               |                       |                |                |                 |                |                 |                  |
`new RegExp('a')`                        | `RegExp`              |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          | TRUE       |           |          |               |                       |                |                |                 |                |                 |                  |
`Math`                                   | `Math`                |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           | TRUE     |               |                       |                |                |                 |                |                 |                  |
`new Int8Array(1)`                       | `Int8Array`           |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          | TRUE          |                       |                |                |                 |                |                 |                  |
`new Uint8ClampedArray(1)`               | `Uint8ClampedArray`   |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               | TRUE                  |                |                |                 |                |                 |                  |
`new Uint8Array(1)`                      | `Uint8Array`          |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       | TRUE           |                |                 |                |                 |                  |
`new Int16Array(1)`                      | `Int16Array`          |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                | TRUE           |                 |                |                 |                  |
`new Uint16Array(1)`                     | `Uint16Array`         |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                | TRUE            |                |                 |                  |
`new Int32Array(1)`                      | `Int32Array`          |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 | TRUE           |                 |                  |
`new Uint32Array(1)`                     | `Uint32Array`         |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                | TRUE            |                  |
`new Float32Array(1)`                    | `Float32Array`        |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 | TRUE             |
`new Float64Array(1)`                    | `Float64Array`        |               |          |             |                     |            |                    |                        |                           |                             |                |                   |                     |                    |            |                    |           | TRUE       |                    |              |               |          |            |           |          |               |                       |                |                |                 |                |                 |                  | TRUE            