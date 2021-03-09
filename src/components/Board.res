open Twind

module Link = Next.Link

@react.component
let make = (~isFallback: bool, ~posts: Result.t<array<Types.Post.t>, string>, ()) => {
  <div>
    {isFallback
      ? <div> {React.string("Loading...")} </div>
      : <>
          {switch posts {
          | Ok(ok) =>
            <ul className={tw(["list-disc"])}>
              {ok
              ->Array.map(post => {
                let key = post.bid ++ "/" ++ post.aid
                let href = Printf.sprintf("/post/%s/%s", post.bid, post.aid)
                <li key> <Link href={href}> {post.title->React.string} </Link> </li>
              })
              ->React.array}
            </ul>
          | Error(err) => <div> {React.string(err)} </div>
          }}
        </>}
  </div>
}
