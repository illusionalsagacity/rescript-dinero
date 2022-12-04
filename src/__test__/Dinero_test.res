open Dinero

Zora.zoraBlock("Dinero", t => {
  let dineroUsd = amount => dinero({currency: Currency.usd, amount})
  let oneDollar = dineroUsd(Int53.fromInt(1000))

  t->Zora.equal(
    oneDollar->create({amount: Int53.fromInt(3000), currency: Currency.usd})->toSnapshot,
    {amount: Int53.fromInt(3000), currency: Currency.usd, scale: 2},
    "create",
  )

  t->Zora.equal(
    oneDollar->toSnapshot,
    {amount: Int53.fromInt(1000), currency: Currency.usd, scale: 2},
    "constructs a Dinero object",
  )

  t->Zora.equal(
    add(
      dinero({amount: Int53.fromInt(100), currency: Currency.usd}),
      dinero({amount: Int53.fromInt(200), currency: Currency.usd}),
    )->toSnapshot,
    {amount: Int53.fromInt(300), currency: Currency.usd, scale: 2},
    "adds two Dinero correctly",
  )

  t->Zora.equal(
    multiplyScaled(
      dinero({amount: Int53.fromInt(100), currency: Currency.usd}),
      {amount: Int53.fromInt(25), scale: 1},
    )->toSnapshot,
    {amount: Int53.fromInt(2500), currency: Currency.usd, scale: 3},
    "multiplies two Dinero with a scaled amount correctly",
  )

  t->Zora.equal(
    {
      let (a, b) = allocate2(
        dinero({amount: Int53.fromInt(20000), currency: Currency.usd}),
        (Int53.fromInt(1), Int53.fromInt(1)),
      )

      (a->toSnapshot, b->toSnapshot)
    },
    (
      dinero({amount: Int53.fromInt(10000), currency: Currency.usd})->toSnapshot,
      dinero({amount: Int53.fromInt(10000), currency: Currency.usd})->toSnapshot,
    ),
    "allocates a Dinero evenly",
  )

  t->Zora.equal(
    multiply(
      dinero({amount: Int53.fromInt(100), currency: Currency.usd}),
      Int53.fromInt(2),
    )->toSnapshot,
    {amount: Int53.fromInt(200), currency: Currency.usd, scale: 2},
    "multiplies two Dinero with a number correctly",
  )

  t->Zora.equal(
    dinero({amount: Int53.fromInt(100), currency: Currency.usd})->toDecimal,
    "1.00",
    "formats a currency correctly",
  )
})
