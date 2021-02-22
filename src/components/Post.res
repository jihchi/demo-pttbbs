@react.component
let make = (~data: Types.Post.t, ~comments: array<Types.Comment.t>, ()) => {
  <div>
    <div> {React.string(data.brdname)} </div>
    <h1> {React.string(data.class)} {React.string(data.title)} </h1>
    <ul className="list-decimal">
      {comments
      ->Js.Array2.map(comment => {
        <li key=comment.cid>
          {comment.content
          ->Js.Array2.map(content => {
            <div>
              {content
              ->Js.Array2.map(content => content.text)
              ->Js.Array2.joinWith(" ")
              ->React.string}
            </div>
          })
          ->React.array}
        </li>
      })
      ->React.array}
    </ul>
  </div>
}
