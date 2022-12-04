/**
https://b.dinerojs.com/docs/guides/using-different-amount-types#implementing-a-custom-calculator
*/
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

/**
Included for convenience; should only be used for currency amounts that are known to be "small".
*/
let int32Calculator: t<int> = {
  add: (a, b) => a + b,
  compare: (a, b) => {
    if a == b {
      0
    } else if a > b {
      1
    } else {
      -1
    }
  },
  decrement: a => a - 1,
  integerDivide: %raw("function (a, b) { return Math.trunc(a / b); }"),
  increment: a => a + 1,
  modulo: %raw("function (a, b) { return a % b; }"),
  multiply: (a, b) => a * b,
  power: (a, b) => Math.Int.pow(a, ~exp=b),
  subtract: (a, b) => a - b,
  zero: () => 0,
}

let int53Calculator: t<Int53.t> = {
  add: Int53.add,
  compare: (a, b) => {
    if Int53.eq(a, b) {
      0
    } else if Int53.greaterThan(a, b) {
      1
    } else {
      -1
    }
  },
  decrement: Int53.subtract(_, Int53.fromInt(1)),
  integerDivide: %raw("function (a, b) { return Math.trunc(a / b); }"),
  modulo: %raw("function (a, b) { return a % b; }"),
  increment: Int53.add(_, Int53.fromInt(1)),
  multiply: Int53.multiply,
  power: Int53.exponent,
  subtract: Int53.subtract,
  zero: () => Int53.fromInt(0),
}

/**
If using this, make sure to have @dinero.js/calculator-bigint installed
*/
@module("@dinero.js/calculator-bigint")
@val
external bigintCalculator: t<Js.Bigint.t> = "calculator"
