let default = () => {
  let router = Next.Router.useRouter()
  let {query} = router
  let board = query->Js.Dict.get("board")
  let slug = query->Js.Dict.get("slug")

  switch (board, slug) {
  | (None, None)
  | (Some(_), None)
  | (None, Some(_)) => React.null
  | (Some(board'), Some(slug')) => <Post board=board' slug=slug' />
  }
}
