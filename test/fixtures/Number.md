x                                        | `isAn(x)`   | `isAn.Number(x)`   | `isAn.Number.Literal(x)`   | `isAn.Number.Literal.NaN(x)`   | `isAn.Number.Literal.Finite(x)`   | `isAn.Number.Literal.Infinite(x)`   | `isAn.Number.Literal.Integer(x)`   | `isAn.Number.Object(x)`   | `isAn.Number.Object.NaN(x)`   | `isAn.Number.Object.Finite(x)`   | `isAn.Number.Object.Infinite(x)`   | `isAn.Number.Object.Integer(x)`   | `isAn.Number.NaN(x)`   | `isAn.Number.Finite(x)`   | `isAn.Number.Infinite(x)`   | `isAn.Number.Integer(x)`  
-----------------------------------------|-------------|--------------------|----------------------------|--------------------------------|-----------------------------------|-------------------------------------|------------------------------------|---------------------------|-------------------------------|----------------------------------|------------------------------------|-----------------------------------|------------------------|---------------------------|-----------------------------|---------------------------
`0`                                      | Number      | TRUE               | TRUE                       |                                | TRUE                              |                                     | TRUE                               |                           |                               |                                  |                                    |                                   |                        | TRUE                      |                             | TRUE                      
`1`                                      | Number      | TRUE               | TRUE                       |                                | TRUE                              |                                     | TRUE                               |                           |                               |                                  |                                    |                                   |                        | TRUE                      |                             | TRUE                      
`1.0`                                    | Number      | TRUE               | TRUE                       |                                | TRUE                              |                                     | TRUE                               |                           |                               |                                  |                                    |                                   |                        | TRUE                      |                             | TRUE                      
`1.5`                                    | Number      | TRUE               | TRUE                       |                                | TRUE                              |                                     |                                    |                           |                               |                                  |                                    |                                   |                        | TRUE                      |                             |                           
`0.1 * 0.2`                              | Number      | TRUE               | TRUE                       |                                | TRUE                              |                                     |                                    |                           |                               |                                  |                                    |                                   |                        | TRUE                      |                             |                           
`0.1 + 0.2`                              | Number      | TRUE               | TRUE                       |                                | TRUE                              |                                     |                                    |                           |                               |                                  |                                    |                                   |                        | TRUE                      |                             |                           
`Infinity`                               | Number      | TRUE               | TRUE                       |                                |                                   | TRUE                                |                                    |                           |                               |                                  |                                    |                                   |                        |                           | TRUE                        |                           
`-Infinity`                              | Number      | TRUE               | TRUE                       |                                |                                   | TRUE                                |                                    |                           |                               |                                  |                                    |                                   |                        |                           | TRUE                        |                           
`NaN`                                    | Number      | TRUE               | TRUE                       | TRUE                           |                                   |                                     |                                    |                           |                               |                                  |                                    |                                   | TRUE                   |                           |                             |                           
`Number.NEGATIVE_INFINITY`               | Number      | TRUE               | TRUE                       |                                |                                   | TRUE                                |                                    |                           |                               |                                  |                                    |                                   |                        |                           | TRUE                        |                           
`Number.POSITIVE_INFINITY`               | Number      | TRUE               | TRUE                       |                                |                                   | TRUE                                |                                    |                           |                               |                                  |                                    |                                   |                        |                           | TRUE                        |                           
`Number.NaN`                             | Number      | TRUE               | TRUE                       | TRUE                           |                                   |                                     |                                    |                           |                               |                                  |                                    |                                   | TRUE                   |                           |                             |                           
`new Number()`                           | Number      | TRUE               |                            |                                |                                   |                                     |                                    | TRUE                      |                               | TRUE                             |                                    | TRUE                              |                        | TRUE                      |                             | TRUE                      
`new Number(1)`                          | Number      | TRUE               |                            |                                |                                   |                                     |                                    | TRUE                      |                               | TRUE                             |                                    | TRUE                              |                        | TRUE                      |                             | TRUE                      
`new Number(1.5)`                        | Number      | TRUE               |                            |                                |                                   |                                     |                                    | TRUE                      |                               | TRUE                             |                                    |                                   |                        | TRUE                      |                             |                           
`new Number(Number.NaN)`                 | Number      | TRUE               |                            |                                |                                   |                                     |                                    | TRUE                      | TRUE                          |                                  |                                    |                                   | TRUE                   |                           |                             |                           
`new Number(Number.NEGATIVE_INFINITY)`   | Number      | TRUE               |                            |                                |                                   |                                     |                                    | TRUE                      |                               |                                  | TRUE                               |                                   |                        |                           | TRUE                        |                           
`new Number(Number.POSITIVE_INFINITY)`   | Number      | TRUE               |                            |                                |                                   |                                     |                                    | TRUE                      |                               |                                  | TRUE                               |                                   |                        |                           | TRUE                        |