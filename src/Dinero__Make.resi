type options<'amount> = {calculator: Dinero__Calculator.t<'amount>}

type t<'amount>

@module("dinero.js")
external createDinero: options<'a> => t<'a> = "createDinero"
