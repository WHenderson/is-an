assert = require('chai').assert
fs = require('fs')
path = require('path')

isAn = require('../dist/is-an.coffee')

suite('coverage', () ->
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

    () -> new Error()
    () -> `try { eval('}') } catch (ex) { return ex; }`; return

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

  checks = []
  table = []

  do () ->
    enumChecks = (func) ->
      for own subName, subFunc of func
        if typeof subFunc == 'function'
          checks.push(subFunc)
          enumChecks(subFunc)

    enumChecks(isAn)

    # javascript column
    table.push(['x'])
    for inputFunc in inputs
      table.push([
        inputFunc.toString().replace(/(\r|\n|\s)+/g, ' ').replace(/^function \(\) {\s*(?:return)?\s*(.*?)(?:;)?\s*}$/, '`$1`')
      ])

  # type column
  test('typename', () ->
    # heading
    table[0].push('`isAn(x)`')

    for inputFunc, iInput in inputs
      typeName = isAn(inputFunc())
      assert(isAn.String.Literal(typeName) or isAn.Undefined(typeName))

      table[1 + iInput].push(
        if typeName? then typeName else '<undefined>'
      )

    return
  )

  # check columns
  do ->
    for check in checks
      do (check) ->
        test("returnChecker: #{check.typeName}", () ->
          assert.equal(isAn(check.typeName, { returnChecker: true }), check)
        )

        test("type: #{check.typeName}", () ->
          table[0].push("`isAn.#{check.typeName}(x)`")
          for inputFunc,iInput in inputs
            isType = check(inputFunc())
            assert(isAn.Boolean.Literal(isType), 'correct result type')
            assert.equal(check, isAn(check.typeName, { returnChecker: true }), 'same function')
            assert.equal(isAn(inputFunc(), check.typeName), isType, 'identical results')

            table[1 + iInput].push(
              if isType then 'TRUE' else ''
            )

          return
        )
  test('invalid type name', () ->
    assert.isUndefined(isAn(1, 'unknown'))
    assert.isUndefined(isAn('unknown', { returnChecker: true }))
  )

  suite('results tables', () ->
    # string padd/truncate
    padd = (x, width, p = '                        ') ->
      while x.length < width
        x += p
      return x.slice(0, width)

    tableToString = (table) ->
      # column widths
      columnWidths = table[0].map(
        (element, iColumn) ->
          Math.max(
            (
              for row in table
                row[iColumn].length
            )...
          ) + 2
      )

      lines = []
      for row, irow in table
        lines.push(
          row.map((element, iElement) -> padd(element, columnWidths[iElement])).join(' | ')
        )
        if irow == 0
          lines.push(
            columnWidths.map((width) -> padd('', width, '-')).join('-|-')
          )
      return lines.join('\r\n')

    compareTable = (name, table) ->
      resultTable = tableToString(table).trim().replace(/(\r\n)|(\r)|(\n)/g, '\r\n')
      error = null
      try
        inputTable = fs.readFileSync(path.join(__dirname, 'fixtures', name + '.md'), 'utf8').trim().replace(/(\r\n)|(\r)|(\n)/g, '\r\n')
      catch ex
        error = ex
        fs.writeFileSync(path.join(__dirname, 'fixtures', name + '.md'), resultTable, 'utf8')

      if not error?
        try
          assert.equal(resultTable, inputTable)
        catch ex
          console.error(resultTable)
          console.error()
          throw ex

    # main chart
    test('complete', () ->
      compareTable('complete', table)
    )

    for own typeName, check  of isAn
      if typeof check == 'function'
        do (typeName) ->
          test("table: #{typeName}", () ->

            groupTable = table.filter(
              (row, iRow) ->
                iRow == 0 or row[1] == typeName
            )

            groupTable = groupTable.map(
              (row, iRow) ->
                row.filter(
                  (cell, iColumn) ->
                    iColumn < 2 or groupTable.some((row, iRow) -> (iRow != 0 and row[iColumn] == 'TRUE'))
                )
            )

            compareTable(typeName, groupTable)
          )

    return
  )

  test('unknown type', () ->
    # monkey patch the types
    n = isAn.Number
    o = isAn.Object

    try
      isAn.Number = () -> false
      assert.isUndefined(isAn(1))

      isAn.Object = () -> true
      assert.equal(isAn(1), 'Object')

    finally
      isAn.Number = n
      isAn.Object = o

  )
)
