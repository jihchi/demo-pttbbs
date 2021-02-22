type props = {hotPosts: array<Types.Post.t>}
type params = unit

let default = props => {
  <TrendingPosts data=props.hotPosts />
}

let getServerSideProps = _ctx => {
  open Promise

  Api.getHotPosts(~limit=100, ~sort=Types.Sort.Desc, ())
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
    }->Belt.Result.Error
  })
  ->then(result => {
    resolve({"props": {hotPosts: result->Belt.Result.getWithDefault([])}})
  })
}
