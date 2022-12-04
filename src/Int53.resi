type t

type conversionError = NotFiniteNumber | ValueTooLarge | ValueTooSmall

external fromInt: int => t = "%identity"

let fromFloat: float => result<t, conversionError>

let fromString: string => option<t>
let eq: (t, t) => bool
let greaterThan: (t, t) => bool
let greaterThanOrEqual: (t, t) => bool
let lessThan: (t, t) => bool
let lessThanOrEqual: (t, t) => bool
external add: (t, t) => t = "%addfloat"
external subtract: (t, t) => t = "%subfloat"
let mod: (t, t) => t
external multiply: (t, t) => t = "%mulfloat"
external divide: (t, t) => t = "%divfloat"
let exponent: (t, t) => t

module Operators: {
  let \"==": (t, t) => bool
  let \">": (t, t) => bool
  let \">=": (t, t) => bool
  let \"<": (t, t) => bool
  let \"<=": (t, t) => bool
  let \"+": (t, t) => t
  let \"-": (t, t) => t
  let \"%": (t, t) => t
  let \"*": (t, t) => t
  let \"/": (t, t) => t
  let \"**": (t, t) => t
}
