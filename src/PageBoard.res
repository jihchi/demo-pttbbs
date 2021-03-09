open Promise

type props = {posts: Result.t<array<Types.Post.t>, string>}
type params = {board: string}

let default = props => {
  let router = Next.Router.useRouter()
  <Board isFallback=router.isFallback posts=props.posts />
}

let getStaticProps: Next.GetStaticProps.t<props, params, _> = ctx => {
  open Next.GetStaticProps
  let {params} = ctx

  Api.getPosts(~boardId=params.board, ())
  ->then(res => {
    res->Fetch.Response.json
  })
  ->then(json => {
    json->%raw(`(json) => json.list`)->Result.Ok->resolve
  })
  ->catch(e => {
    switch e {
    | JsError(err) => err->Js.Exn.message->Js.Option.getWithDefault("", _)
    | _ => "Unexpected error occurred"
    }
    ->Belt.Result.Error
    ->resolve
  })
  ->then(results => {
    resolve({
      "props": {
        posts: results,
      },
    })
  })
}

let getStaticPaths: Next.GetStaticPaths.t<params> = _params => {
  open Next.GetStaticPaths

  resolve({paths: [], fallback: true})
}
