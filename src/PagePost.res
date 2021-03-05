open Promise

type props = {
  post: Result.t<Types.Post.t, string>,
  comments: Result.t<array<Types.Comment.t>, string>,
}
type params = {board: string, slug: string}

let default = props => {
  let router = Next.Router.useRouter()
  <Post isFallback=router.isFallback post=props.post comments=props.comments />
}

let getStaticProps: Next.GetStaticProps.t<props, params, _> = ctx => {
  open Next.GetStaticProps
  let {params} = ctx

  Promise.all2((
    Api.getPost(~boardId=params.board, ~postId=params.slug),
    Api.getComment(~boardId=params.board, ~postId=params.slug),
  ))
  ->then(res => {
    Promise.all2((res->fst->Fetch.Response.json, res->snd->Fetch.Response.json))
  })
  ->then(json => {
    resolve(
      Result.Ok((json->fst->%raw(`(json) => json`), json->snd->%raw(`(json) => json["list"]`))),
    )
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
        post: results->Result.map(fst),
        comments: results->Result.map(snd),
      },
    })
  })
}

let getStaticPaths: Next.GetStaticPaths.t<params> = _params => {
  open Next.GetStaticPaths

  resolve({paths: [], fallback: true})
}
