toString = (x) -> ({}).toString.call(x)

primitive = (x) -> typeof x != 'object' and not _.null(x)

_ = (x,type) ->
  if type?
    return _[type](x)

  name = toString(x).slice('[object '.length, -1).toLowerCase()
  if _[name]? an _[name](x)
    return name

  for own type, func of _
    if func(x)
      return type
      
  return

_.undefined = (x) -> toString(x) == '[object Undefined]'

_.null = (x) -> toString(x) == '[object Null]'

_.boolean = (x) -> toString(x) == '[object Boolean]'

_.boolean.primitive = (x) -> _.boolean(x) and primitive(x)

_.number = (x) -> toString(x) == '[object Number]'

_.number.primitive = (x) -> _.number(x) and primitive(x)

_.number.nan = (x) -> _.number(x) and x != x

_.number.finite = (x) -> not _.number.infinite(x) and not _.number.nan(x)

_.number.infinite = (x) -> x == Infinity || x == -Infinity

_.number.primitive.nan = (x) -> _.number.nan(x) and primitive(x)

_.number.primitive.finite = (x) -> _.number.finite(x) and primitive(x)

_.number.primitive.infinite = (x) -> _.number.infinite(x) and primitive(x)

_.number.integer = (x) -> _.number.finite(x) and Math.floor(x) == x

_.string = (x) -> toString(x) == '[object String]'

_.string.primitive = (x) -> _.string(x) and primitive(x)

_.array =
  if Array.isArray?
    Array.isArray
  else
    (x) -> toString(x) == '[object Array]'

_.object = (x) -> toString(x) == '[object Object]'

_.object.literal = (x) -> _.object(x) and x.constructor == ({}).constructor

_.function = (x) -> toString(x) == '[object Function]'

_.arguments = (x) -> toString(x) == '[object Arguments]'

_.date = (x) -> toString(x) == '[object Date]'

_.symbol = (x) -> toString(x) == '[object Symbol]'

_.regexp = (x) -> _.object(x) and x instanceof RegExp

_.error = (x) -> toString(x) == '[object Error]'
  
_.math = (x) -> toString(x) == '[object Math]'

_.int8array = (x) -> toString(x) == '[object Int8Array]'

_.uint8clampedarray = (x) -> toString(x) == '[object Uint8ClampedArray]'

_.uint8array = (x) -> toString(x) == '[object Uint8Array]'

_.int16array = (x) -> toString(x) == '[object Int16Array]'

_.uint16array = (x) -> toString(x) == '[object Uint16Array]'

_.int32array = (x) -> toString(x) == '[object Int32Array]'

_.uint32array = (x) -> toString(x) == '[object Uint32Array]'

_.float32array = (x) -> toString(x) == '[object Float32Array]'

_.float64array = (x) -> toString(x) == '[object Float64Array]'
