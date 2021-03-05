type props = {hotBoards: array<Types.Board.t>}
type params = unit

let default = (props: props) => {
  <TrendingBoards data=props.hotBoards />
}

let getServerSideProps = _ctx => {
  open Promise

  Api.getHotBoards()
  ->then(res => {
    res->Fetch.Response.json
  })
  ->then(json => {
    json->%raw(`(json) => json["list"]`)->Js.Option.getWithDefault([], _)->Result.Ok->resolve
  })
  ->catch(e => {
    switch e {
    | JsError(err) => err->Js.Exn.message->Js.Option.getWithDefault("", _)
    | _ => "Unexpected error occurred"
    }
    ->Belt.Result.Error
    ->resolve
  })
  ->then(result => {
    resolve({"props": {hotBoards: result->Belt.Result.getWithDefault([])}})
  })
}
