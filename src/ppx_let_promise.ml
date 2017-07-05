let map promise f =
  Js.Promise.then_ (fun v -> Js.Promise.resolve (f v)) promise

let bind promise f =
  Js.Promise.then_ f promise

let both promise_a promise_b =
  let on_b a b = Js.Promise.resolve (a, b) in
  let on_a a = Js.Promise.then_ (on_b a) promise_b in
  Js.Promise.then_ on_a promise_a

let return =
  Js.Promise.resolve

module Let_syntax = struct
  let return = return
  let bind = bind
  let map = map
  let both = both

  module Open_in_body = struct
    let return = return
  end

  module Open_on_rhs = struct
    let return = return
  end
end

