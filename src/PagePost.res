open Promise

type props = {post: Types.Post.t, comments: array<Types.Comment.t>}
type params = {board: string, slug: string}

let default = props => {
  let router = Next.Router.useRouter()
  <Post isFallback=router.isFallback data=props.post comments=props.comments />
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
    }->Belt.Result.Error
  })
  ->then(result => {
    let result = result->Belt.Result.getWithDefault((
      {
        Types.Post.bid: "",
        aid: "",
        owner: "",
        title: "",
        class: "",
        brdname: "",
      },
      [],
    ))

    resolve({
      "props": {
        post: result->fst,
        comments: result->snd,
      },
    })
  })
}

let getStaticPaths: Next.GetStaticPaths.t<params> = _params => {
  open Next.GetStaticPaths

  resolve({paths: [], fallback: true})
}
