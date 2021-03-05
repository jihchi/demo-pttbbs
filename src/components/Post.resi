@react.component
let make: (
  ~isFallback: bool,
  ~post: Result.t<Types.Post.t, string>,
  ~comments: Result.t<array<Types.Comment.t>, string>,
  unit,
) => React.element
