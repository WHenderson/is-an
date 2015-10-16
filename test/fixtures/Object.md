x                  | `isAn(x)`   | `isAn.Object(x)`   | `isAn.Object.Literal(x)`  
-------------------|-------------|--------------------|---------------------------
`{}`               | Object      | TRUE               | TRUE                      
`new Object()`     | Object      | TRUE               | TRUE                      
`new Object({})`   | Object      | TRUE               | TRUE                      
`new Base()`       | Object      | TRUE               |                           
`new Derived()`    | Object      | TRUE               |