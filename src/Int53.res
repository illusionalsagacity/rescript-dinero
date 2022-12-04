/***
This module exists to mimic the JavaScript Number behavior, where the "int" is 53 bits, rather than 32 in ReScript.
*/

/**
A 53-bit integer type, to enforce a safe integer using JS Numbers.
*/
type t

type conversionError = NotFiniteNumber | ValueTooLarge | ValueTooSmall

@val @scope("Number")
external maxSafeInteger: float = "MAX_SAFE_INTEGER"

@val @scope("Number")
external minSafeInteger: float = "MIN_SAFE_INTEGER"

external unsafe_fromFloat: float => t = "%identity"

/**
Converts an int to an Int53. This is a no-op at runtime
*/
external fromInt: int => t = "%identity"

/**
Converts a float to a result<Int53.t, conversionError>. This will use Math.trunc to remove any fractional component to the float.
*/
let fromFloat = value => {
  if !Float.isFinite(value) {
    Error(NotFiniteNumber)
  } else if value > maxSafeInteger {
    Error(ValueTooLarge)
  } else if value < minSafeInteger {
    Error(ValueTooSmall)
  } else {
    value->Math.trunc->unsafe_fromFloat->Ok
  }
}

let fromString: string => option<t> = value => Int.fromString(~radix=10, value)->Option.map(fromInt)

// comparisons
let eq: (t, t) => bool = %raw(`function (a, b) { return a == b; }`)
let greaterThan: (t, t) => bool = %raw(`function (a, b) { return a > b; }`)
let greaterThanOrEqual: (t, t) => bool = %raw(`function (a, b) { return a >= b; }`)
let lessThan: (t, t) => bool = %raw(`function (a, b) { return a < b; }`)
let lessThanOrEqual: (t, t) => bool = %raw(`function (a, b) { return a <= b; }`)

// operations
external add: (t, t) => t = "%addfloat"
external subtract: (t, t) => t = "%subfloat"
let mod: (t, t) => t = %raw(`function (a, b) { return a % b; }`)
external multiply: (t, t) => t = "%mulfloat"
external divide: (t, t) => t = "%divfloat"

@scope("Math")
external exponent: (t, t) => t = "pow"

module Operators = {
  let \"==" = eq
  let \">" = greaterThan
  let \">=" = greaterThanOrEqual
  let \"<" = lessThan
  let \"<=" = lessThanOrEqual

  let \"+" = add
  let \"-" = subtract
  let \"%" = mod
  let \"*" = multiply
  let \"/" = divide
  let \"**" = exponent
}
