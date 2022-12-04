type t<'value> = {
  add: ('value, 'value) => 'value,
  compare: ('value, 'value) => int,
  decrement: 'value => 'value,
  integerDivide: ('value, 'value) => 'value,
  increment: 'value => 'value,
  modulo: ('value, 'value) => 'value,
  multiply: ('value, 'value) => 'value,
  power: ('value, 'value) => 'value,
  subtract: ('value, 'value) => 'value,
  zero: unit => 'value,
}

let int32Calculator: t<int>

let int53Calculator: t<Int53.t>

@module("@dinero.js/calculator-bigint") @val
external bigintCalculator: t<Js.Bigint.t> = "calculator"
