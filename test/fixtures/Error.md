x                                               | `isAn(x)`   | `isAn.Error(x)`  
------------------------------------------------|-------------|------------------
`new Error()`                                   | Error       | TRUE             
`try { eval('}') } catch (ex) { return ex; }`   | Error       | TRUE