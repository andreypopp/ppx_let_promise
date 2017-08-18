# ppx_let bindings for BuckleScript's Js.Promise.t

Like async/await syntax for Promises in JS but for OCaml.

Install:

    npm install andreypopp/ppx_let andreypopp/ppx_let_promise

Add to `bsconfig.json`:

    {
      ...
      "ppx-flags": [
        "ppx_let/ppx"
      ],
      "bs-dependencies": [
        "ppx_let_promise"
      ],
      ...
    }

Use `ppx_let` with `Js.Promise.t`:
```ocaml
open Ppx_let_promise;;


let hello () =
  let%bind message = Js.Promise.resolve "Hello!" in
  print_endline message;
  Js.Promise.resolve ();;

hello ();

```
