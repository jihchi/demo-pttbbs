open Fetch

let makeEndpoint = endpoint => {
  Printf.sprintf("%s%s", Config.getApiUrl()->Utils.removeTrailingSlash, endpoint)
}

let getHotPosts = (~limit=3, ~sort=Types.Sort.Desc, ()) => {
  fetch(
    Printf.sprintf(
      "%s?limit=%d&desc=%s",
      makeEndpoint("/api/articles/popular"),
      limit,
      sort == Types.Sort.Desc ? "true" : "false",
    ),
  )
}

let getHotBoards = () => {
  fetch(makeEndpoint("/api/boards/popular"))
}
