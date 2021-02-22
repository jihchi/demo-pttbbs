@react.component
let make = (~board: string, ~slug: string) => {
  <div> {React.string(Printf.sprintf("Board: %s, Post: %s", board, slug))} </div>
}
