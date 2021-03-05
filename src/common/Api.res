open Fetch

let getHotPosts = (~limit=3, ~sort=Types.Sort.Desc, ()) => {
  fetch(
    Printf.sprintf(
      "%s/api/articles/popular?limit=%d&desc=%s",
      Config.getApiUrl(),
      limit,
      sort == Types.Sort.Desc ? "true" : "false",
    ),
  )
}

let getHotBoards = () => {
  fetch(Printf.sprintf("%s/api/boards/popular", Config.getApiUrl()))
}

let getPost = (~boardId, ~postId) => {
  fetch(Printf.sprintf("%s/api/board/%s/article/%s", Config.getApiUrl(), boardId, postId))
}

let getComment = (~boardId, ~postId) => {
  fetch(Printf.sprintf("%s/api/board/%s/article/%s/comments", Config.getApiUrl(), boardId, postId))
}
