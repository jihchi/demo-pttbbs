@val @scope(("process", "env"))
external api: Js.Undefined.t<string> = "NEXT_PUBLIC_API"

let getApiUrl = () =>
  api
  ->Js.Undefined.toOption
  ->Belt.Option.getWithDefault("<`NEXT_PUBLIC_API` is unset>")
  ->Utils.removeTrailingSlash
