module Link = Next.Link

@react.component
let make = (~data: array<Types.Post.t>) => {
  <div>
    <ul className="list-disc">
      {data
      ->Js.Array2.map(post => {
        let key = post.bid ++ "/" ++ post.aid
        let href = Printf.sprintf("/post/%s/%s", post.bid, post.aid)
        <li key> <Link href={href}> {post.title->React.string} </Link> </li>
      })
      ->React.array}
    </ul>
  </div>
}
