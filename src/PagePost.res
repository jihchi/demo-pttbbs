type props = {post: Types.Post.t, comments: array<Types.Comment.t>}
type params = {board: string, slug: string}

let default = props => {
  <Post data=props.post comments=props.comments />
}

let getServerSideProps: Next.GetServerSideProps.t<props, params, _> = ctx => {
  open Promise

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
