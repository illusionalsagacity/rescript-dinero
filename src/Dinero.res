module Calculator = Dinero__Calculator
module Currency = Dinero__Currency
module Make = Dinero__Make
module DivideOperation = Dinero__DivideOperation

type snapshot<'amount> = {
  amount: 'amount,
  currency: Currency.t,
  scale: int,
}

type options<'amount> = {
  amount: 'amount,
  currency: Currency.t,
  scale?: int,
}

type scaledAmount<'amount> = {
  amount: 'amount,
  scale: int,
}

type t<'amount> = {calculator: Calculator.t<'amount>}

@send
external create: (t<'amount>, options<'amount>) => t<'amount> = "create"

@module("dinero.js")
external dinero: options<Int53.t> => t<Int53.t> = "dinero"

// Mutations

@module("dinero.js")
external add: (t<'amount>, t<'amount>) => t<'amount> = "add"

@module("dinero.js")
external subtract: (t<'amount>, t<'amount>) => t<'amount> = "subtract"

@module("dinero.js")
external multiply: (t<'amount>, 'amount) => t<'amount> = "multiply"

@module("dinero.js")
external multiplyScaled: (t<'amount>, scaledAmount<'amount>) => t<'amount> = "multiply"

@module("dinero.js")
external allocate: (t<'amount>, array<'amount>) => t<'amount> = "allocate"

@module("dinero.js")
external allocate2: (t<'amount>, ('amount, 'amount)) => (t<'amount>, t<'amount>) = "allocate"

@module("dinero.js")
external allocate3: (
  t<'amount>,
  ('amount, 'amount, 'amount),
) => (t<'amount>, t<'amount>, t<'amount>) = "allocate"

@module("dinero.js")
external allocate4: (
  t<'amount>,
  ('amount, 'amount, 'amount, 'amount),
) => (t<'amount>, t<'amount>, t<'amount>, t<'amount>) = "allocate"

@module("dinero.js")
external allocate5: (
  t<'amount>,
  ('amount, 'amount, 'amount, 'amount, 'amount),
) => (t<'amount>, t<'amount>, t<'amount>, t<'amount>, t<'amount>) = "allocate"

@module("dinero.js")
external allocate6: (
  t<'amount>,
  ('amount, 'amount, 'amount, 'amount, 'amount, 'amount),
) => (t<'amount>, t<'amount>, t<'amount>, t<'amount>, t<'amount>, t<'amount>) = "allocate"

@module("dinero.js")
external allocate7: (
  t<'amount>,
  ('amount, 'amount, 'amount, 'amount, 'amount, 'amount, 'amount),
) => (t<'amount>, t<'amount>, t<'amount>, t<'amount>, t<'amount>, t<'amount>, t<'amount>) =
  "allocate"

@module("dinero.js")
external allocate8: (
  t<'amount>,
  ('amount, 'amount, 'amount, 'amount, 'amount, 'amount, 'amount, 'amount),
) => (
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
) = "allocate"

@module("dinero.js")
external allocate9: (
  t<'amount>,
  ('amount, 'amount, 'amount, 'amount, 'amount, 'amount, 'amount, 'amount, 'amount),
) => (
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
  t<'amount>,
) = "allocate"

@module("dinero.js")
external allocateScaled: (t<'amount>, array<scaledAmount<'amount>>) => t<'amount> = "allocate"

// conversions

@module("dinero.js")
external convert: (t<'amount>, Currency.t, Js.Dict.t<'amount>) => t<'amount> = "convert"

@module("dinero.js")
external convertScaled: (t<'amount>, Currency.t, Js.Dict.t<scaledAmount<'amount>>) => t<'amount> =
  "convert"

@module("dinero.js")
external normalizeScale: array<t<'amount>> => array<t<'amount>> = "normalizeScale"

@module("dinero.js")
external transformScale: (t<'amount>, int) => t<'amount> = "transformScale"

@module("dinero.js")
external transformScaleWithDivide: (t<'amount>, int, DivideOperation.t) => t<'amount> =
  "transformScale"

@module("dinero.js")
external trimScale: t<'amount> => t<'amount> = "trimScale"

// comparisons

@module("dinero.js")
external equal: (t<'amount>, t<'amount>) => bool = "equal"

@module("dinero.js")
external compare: (t<'amount>, t<'amount>) => int = "compare"

@module("dinero.js")
external greaterThan: (t<'amount>, t<'amount>) => bool = "greaterThan"

@module("dinero.js")
external greaterThanOrEqual: (t<'amount>, t<'amount>) => bool = "greaterThanOrEqual"

@module("dinero.js")
external lessThan: (t<'amount>, t<'amount>) => bool = "lessThan"

@module("dinero.js")
external lessThanOrEqual: (t<'amount>, t<'amount>) => bool = "lessThanOrEqual"

@module("dinero.js")
external minimum: array<t<'amount>> => t<'amount> = "minimum"

@module("dinero.js")
external maximum: array<t<'amount>> => t<'amount> = "maximum"

@module("dinero.js")
external isZero: t<'amount> => bool = "isZero"

@module("dinero.js")
external isPositive: t<'amount> => bool = "isPositive"

@module("dinero.js")
external isNegative: t<'amount> => bool = "isNegative"

@module("dinero.js")
external haveSameAmount: array<t<'amount>> => bool = "haveSameAmount"

@module("dinero.js")
external haveSameCurrency: array<t<'amount>> => bool = "haveSameCurrency"

@module("dinero.js")
external hasSubUnits: t<'amount> => bool = "hasSubUnits"

type transformerOptions<'amount> = {
  amount: 'amount,
  currency: Currency.t,
  dineroObject: t<'amount>,
}

// Formatting

type transformer<'amount, 'output> = transformerOptions<'amount> => 'output

@module("dinero.js")
external toDecimal: t<'amount> => string = "toDecimal"

@module("dinero.js")
external toDecimalWithTransformer: (t<'amount>, transformer<'amount, 'output>) => 'output =
  "toDecimal"

@module("dinero.js")
external toSnapshot: t<'amount> => snapshot<'amount> = "toSnapshot"

@send
external toJSON: t<'amount> => snapshot<'amount> = "toJSON"

@module("dinero.js")
external toUnits: t<'amount> => array<'amount> = "toUnits"

@module("dinero.js")
external toUnitsWithTransformer: (t<'amount>, transformer<'amount, 'output>) => array<'output> =
  "toUnits"
