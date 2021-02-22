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
  ->then(((resPost, resComment)) => {
    Promise.all2((resPost->Fetch.Response.json, resComment->Fetch.Response.json))
  })
  ->then(((jsonPost, jsonComment)) => {
    Result.Ok((jsonPost->%raw(`(json) => json`), jsonComment->%raw(`(json) => json["list"]`)))->resolve
  })
  ->catch(e => {
    switch e {
    | JsError(err) => err->Js.Exn.message->Js.Option.getWithDefault("", _)
    | _ => "Unexpected error occurred"
    }->Belt.Result.Error
  })
  ->then(result => {
    let emptyPost = {
      Types.Post.bid: "",
      aid: "",
      owner: "",
      title: "",
      class: "",
      brdname: "",
    }
    resolve({
      "props": {
        post: result->Belt.Result.getWithDefault((emptyPost, []))->fst,
        comments: result->Belt.Result.getWithDefault((emptyPost, []))->snd,
      },
    })
  })
}
