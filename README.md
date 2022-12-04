# rescript-dinero

A zero-code ReScript bindings package for [dinero.js](https://v2.dinerojs.com/docs) v2.

Note that most types that expect a JavaScript integer accept a ReScript float. This is because the int in ReScript is only 32 bits wide, whereas JavaScript integers can be safely represented up to 52 bits. i.e. `(2 ** 53) - 1` in JavaScript, vs `(2 ** 32) - 1` in ReScript. To ensure you are using a `Number` without a floating point you can use `Js.Math.trunc` on a float value that is not known at compile-time.
