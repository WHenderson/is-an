assert = require('chai').assert

suite('coverage', () ->
  is_ = null

  setup(() ->
    is_ = require('../dist/is-an.coffee')
  )

  class Base
  class Derived extends Base

  inputs = [
    () -> undefined
    () -> `undefined`

    () -> null

    () -> true
    () -> false
    () -> new Boolean(true)
    () -> new Boolean(false)
    () -> new Boolean()

    () -> 0
    () -> 1
    () -> 1.0
    () -> 1.5
    () -> 0.1 * 0.2
    () -> 0.1 + 0.2
    () -> Infinity
    () -> -Infinity
    () -> NaN
    () -> Number.NEGATIVE_INFINITY
    () -> Number.POSITIVE_INFINITY
    () -> Number.NaN
    () -> new Number()
    () -> new Number(1)
    () -> new Number(1.5)
    () -> new Number(Number.NaN)
    () -> new Number(Number.NEGATIVE_INFINITY)
    () -> new Number(Number.POSITIVE_INFINITY)

    () -> 's'
    () -> new String('s')
    () -> new String()

    () -> []
    () -> new Array()
    () -> new Array(1)
    () -> Array(1)

    () -> {}
    () -> new Object()
    () -> new Object({})
    () -> new Base()
    () -> new Derived()

    () -> () ->
    () -> `function f () {}`

    () -> arguments

    () -> new Date()

    () -> /a/
    () -> new RegExp()
    () -> new RegExp('a')

    () -> Math

    () -> new Int8Array(1)
    () -> new Uint8ClampedArray(1)
    () -> new Uint8Array(1)
    () -> new Int16Array(1)
    () -> new Uint16Array(1)
    () -> new Int32Array(1)
    () -> new Uint32Array(1)
    () -> new Float32Array(1)
    () -> new Float64Array(1)
  ]

  test('generate chart', () ->
    rows = [['javascript']]

    # Create header row
    head = (func, names = []) ->
      if names.length == 0
        rows[0].push('type name')
      else
        rows[0].push("`#{names.join('.')}`")

      for own name of func
        head(func[name], names.concat([name]))

      return
    head(is_)

    # Result rows
    for input in inputs
      row = []
      rows.push(row)

      # javascript value (extracted from function body)
      row.push(input.toString().replace(/^function \(\) {\s*(?:return)?\s*(.*?)(?:;)?\s*}$/, '`$1`'))

      # value
      value = input()

      # Result cells
      check = (func, names = []) ->
        if names.length == 0
          typeName = func(value)
          row.push(if typeName then "`#{typeName}`" else '<undefined>')
        else
          row.push(if func(value) then 'TRUE' else '')

        for own name of func
          check(func[name], names.concat([name]))

        return

      check(is_)

    columnWidths = rows[0].map(
      (element, iColumn) ->
        Math.max(
          (
            for row in rows
              row[iColumn].length
          )...
        ) + 2
    )

    padd = (x, width, p = '                        ') ->
      while x.length < width
        x += p
      return x.slice(0, width)

    for row,irow in rows
      console.log(
        row.map((element, iElement) -> padd(element, columnWidths[iElement])).join(' | ')
      )
      if irow == 0
        console.log(columnWidths.map((width) -> padd('', width, '-')).join('-|-'))

    #console.log(rows)
  )
)
