toString = (x) -> ({}).toString.call(x)

literal = (x) -> typeof x != 'object'

isAn = (x, type) ->
  if type?
    if isAn.Object(type)
      options = type
      type = x

    # detect type
    func = isAn[type]

    if not func?
      func = isAn
      for subTypeName in type.split('.')
        func = func[subTypeName]
        if not func?
          return undefined

    if options?.getter
      # return the checker function
      return func
    else
      # return the detected result
      return func(x)
  else
    # report type
    name = toString(x).slice('[object '.length, -1)
    if isAn[name]? and isAn.Function(isAn[name]) and isAn[name](x)
      return name

    for own type, func of isAn
      if isAn.Function(isAn[name]) and func(x)
        return type

    # cannot determine type
    return

isAn.Undefined = (x) -> toString(x) == '[object Undefined]'

isAn.Null = (x) -> toString(x) == '[object Null]'

isAn.Boolean = (x) -> toString(x) == '[object Boolean]'

isAn.Boolean.Literal = (x) -> isAn.Boolean(x) and literal(x)

isAn.Boolean.Object = (x) -> isAn.Boolean(x) and not literal(x)

isAn.Number = (x) -> toString(x) == '[object Number]'

isAn.Number.Literal = (x) -> isAn.Number(x) and literal(x)

isAn.Number.Object = (x) -> isAn.Number(x) and not literal(x)

isAn.Number.NaN = (x) -> isAn.Number(x) and isNaN(x)

isAn.Number.Finite = (x) -> isAn.Number(x) and isFinite(x)

isAn.Number.Infinite = (x) -> isAn.Number(x) and (Number(x) == Infinity or Number(x) == -Infinity)

isAn.Number.Integer = (x) -> isAn.Number.Finite(x) and Math.floor(x) == Number(x)

isAn.Number.Literal.NaN = (x) -> isAn.Number.NaN(x) and literal(x)

isAn.Number.Literal.Finite = (x) -> isAn.Number.Finite(x) and literal(x)

isAn.Number.Literal.Infinite = (x) -> x == Infinity or x == -Infinity

isAn.Number.Literal.Integer = (x) -> isAn.Number.Finite(x) and Math.floor(x) == x

isAn.Number.Object.NaN = (x) -> isAn.Number.NaN(x) and not literal(x)

isAn.Number.Object.Finite = (x) -> isAn.Number.Finite(x) and not literal(x)

isAn.Number.Object.Infinite = (x) -> isAn.Number.Object(x) and (Number(x) == Infinity or Number(x) == -Infinity)

isAn.Number.Object.Integer = (x) -> isAn.Number.Object.Finite(x) and Math.floor(x) == Number(x)

isAn.String = (x) -> toString(x) == '[object String]'

isAn.String.Literal = (x) -> isAn.String(x) and literal(x)

isAn.String.Object = (x) -> isAn.String(x) and not literal(x)

isAn.Array =
  if Array.isArray?
    Array.isArray
  else
    (x) -> toString(x) == '[object Array]'

isAn.Object = (x) -> toString(x) == '[object Object]'

isAn.Object.Literal = (x) -> toString(x) == '[object Object]' and x.constructor == ({}).constructor

isAn.Function = (x) -> toString(x) == '[object Function]'

isAn.Arguments = (x) -> toString(x) == '[object Arguments]'

isAn.Date = (x) -> toString(x) == '[object Date]'

isAn.RegExp = (x) -> toString(x) == '[object RegExp]'

isAn.Error = (x) -> toString(x) == '[object Error]'

isAn.Math = (x) -> toString(x) == '[object Math]'

isAn.Int8Array = (x) -> toString(x) == '[object Int8Array]'

isAn.Uint8ClampedArray = (x) -> toString(x) == '[object Uint8ClampedArray]'

isAn.Uint8Array = (x) -> toString(x) == '[object Uint8Array]'

isAn.Int16Array = (x) -> toString(x) == '[object Int16Array]'

isAn.Uint16Array = (x) -> toString(x) == '[object Uint16Array]'

isAn.Int32Array = (x) -> toString(x) == '[object Int32Array]'

isAn.Uint32Array = (x) -> toString(x) == '[object Uint32Array]'

isAn.Float32Array = (x) -> toString(x) == '[object Float32Array]'

isAn.Float64Array = (x) -> toString(x) == '[object Float64Array]'

# _.symbol = (x) -> toString(x) == '[object Symbol]'

# Give each type checker a typeName matching its distinguished function name
setTypeNames = (func, name) ->
  for own typeName, subFunc of func
    if isAn.Function(subFunc)
      subName = name + typeName
      subFunc.typeName = subName
      setTypeNames(subFunc, subName + '.')
setTypeNames(isAn, '')
