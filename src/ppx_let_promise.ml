let map promise f =
  Js.Promise.then_ (fun v -> Js.Promise.resolve (f v)) promise

let bind promise f =
  Js.Promise.then_ f promise

let both promise_a promise_b =
  Js.Promise.all2 (promise_a, promise_b)

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

