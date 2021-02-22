module Link = Next.Link

@react.component
let make = (~data: array<Types.Board.t>) => {
  <div>
    <ul className="list-disc">
      {data
      ->Js.Array2.map(board => {
        let key = board.bid
        let href = Printf.sprintf("/post/%s", board.bid)
        <li key> <Link href={href}> {board.brdname->React.string} </Link> </li>
      })
      ->React.array}
    </ul>
  </div>
}
