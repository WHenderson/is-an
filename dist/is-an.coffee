toString = (x) -> ({}).toString.call(x)

literal = (x) -> typeof x != 'object' and not _.Null(x)

_ = (x, type) ->
  if type?
    return _[type](x)

  name = toString(x).slice('[object '.length, -1)
  if _[name]? and _[name](x)
    return name

  for own type, func of _
    if func(x)
      return type

  return

_.Undefined = (x) -> toString(x) == '[object Undefined]'

_.Null = (x) -> toString(x) == '[object Null]'

_.Boolean = (x) -> toString(x) == '[object Boolean]'

_.Boolean.Literal = (x) -> _.Boolean(x) and literal(x)

_.Number = (x) -> toString(x) == '[object Number]'

_.Number.Literal = (x) -> _.Number(x) and literal(x)

_.Number.NaN = (x) -> _.Number(x) and isNaN(x)

_.Number.Finite = (x) -> _.Number(x) and isFinite(x)

_.Number.Infinite = (x) -> _.Number(x) and (Number(x) == Infinity or Number(x) == -Infinity)

_.Number.Literal.NaN = (x) -> _.Number.NaN(x) and literal(x)

_.Number.Literal.Finite = (x) -> _.Number.Finite(x) and literal(x)

_.Number.Literal.Infinite = (x) -> x == Infinity or x == -Infinity

_.Number.Integer = (x) -> _.Number.Finite(x) and Math.floor(x) == x

_.String = (x) -> toString(x) == '[object String]'

_.String.Literal = (x) -> _.String(x) and literal(x)

_.Array =
  if Array.isArray?
    Array.isArray
  else
    (x) -> toString(x) == '[object Array]'

_.Object = (x) -> typeof x == 'object'

_.Object.literal = (x) -> toString(x) == '[object Object]' and x.constructor == ({}).constructor

_.Function = (x) -> toString(x) == '[object Function]'

_.Arguments = (x) -> toString(x) == '[object Arguments]'

_.Date = (x) -> toString(x) == '[object Date]'

_.RegExp = (x) -> _.Object(x) and x instanceof RegExp

_.Error = (x) -> toString(x) == '[object Error]'

_.Math = (x) -> toString(x) == '[object Math]'

_.Int8Array = (x) -> toString(x) == '[object Int8Array]'

_.Uint8ClampedArray = (x) -> toString(x) == '[object Uint8ClampedArray]'

_.Uint8Array = (x) -> toString(x) == '[object Uint8Array]'

_.Int16Array = (x) -> toString(x) == '[object Int16Array]'

_.Uint16Array = (x) -> toString(x) == '[object Uint16Array]'

_.Int32Array = (x) -> toString(x) == '[object Int32Array]'

_.Uint32Array = (x) -> toString(x) == '[object Uint32Array]'

_.Float32Array = (x) -> toString(x) == '[object Float32Array]'

_.Float64Array = (x) -> toString(x) == '[object Float64Array]'

# _.symbol = (x) -> toString(x) == '[object Symbol]'

module.exports = _