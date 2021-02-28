@react.component
let make = (
  ~isFallback: bool,
  ~post: Result.t<Types.Post.t, string>,
  ~comments: Result.t<array<Types.Comment.t>, string>,
  (),
) => {
  <div>
    {isFallback
      ? <div> {React.string("Loading...")} </div>
      : <>
          {switch post {
          | Ok(ok) => <>
              <div> {React.string(ok.brdname)} </div>
              <h1> {React.string(ok.class)} {React.string(ok.title)} </h1>
            </>
          | Error(err) => <div> {React.string(err)} </div>
          }}
          {switch comments {
          | Ok(ok) =>
            <ul className="list-decimal">
              {ok
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
          | Error(err) => <div> {React.string(err)} </div>
          }}
        </>}
  </div>
}
