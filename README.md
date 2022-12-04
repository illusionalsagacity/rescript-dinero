# rescript-dinero

A low-code ReScript bindings package for [dinero.js v2](https://v2.dinerojs.com/docs). (currently in Alpha)

Note that most types that expect a JavaScript integer accept a ReScript float. This is because the int in ReScript is only 32 bits wide, whereas JavaScript integers can be safely represented up to 53 bits. i.e. `(2 ** 53) - 1` in JavaScript, vs `(2 ** 32) - 1` in ReScript. To ensure you are using a `Number` without a floating point you can use `Int53.fromFloat` on a float value (that you do not care about the floating-point component) that is not known at compile-time.

## Usage

### Int53 (JavaScript Number)

`Int53` is the default value type for these dinero bindings, and should work out of the box with the default [number calculator](https://github.com/dinerojs/dinero.js/tree/main/packages/calculator-number). However, if you want to use the ReScript implementation of the calculator, you can use the following:

```rescript
let int53Dinero = Dinero.Make.createDinero({calculator: Calculator.int53Calculator})
```

### BigInt

Requires `@dinero.js/calculator-bigint` to be installed. Unless you know you will need the precision of `bigint`, you may not want to use this as it incurs a runtime cost.

```rescript
let bigintDinero = Dinero.Make.createDinero({calculator: Calculator.bigintCalculator})
```

### Int32

This is not recommended unless you know ahead of time the values will be constrained to 32bit integers.

```rescript
let int32Dinero = Dinero.Make.createDinero({calculator: Calculator.int32Calculator})
```
