@react.component
let make = (~isFallback: bool, ~data: Types.Post.t, ~comments: array<Types.Comment.t>, ()) => {
  <div>
    {isFallback
      ? <div> {React.string("Loading...")} </div>
      : <>
          <div> {React.string(data.brdname)} </div>
          <h1> {React.string(data.class)} {React.string(data.title)} </h1>
          <ul className="list-decimal">
            {comments
            ->Js.Array2.map(comment => {
              <li key=comment.cid>
                {comment.content
                ->Js.Array2.mapi((content, i) => {
                  <div key={Printf.sprintf("%s[%d]", comment.cid, i)}>
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
        </>}
  </div>
}
