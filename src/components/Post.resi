@react.component
let make: (
  ~isFallback: bool,
  ~data: Types.Post.t,
  ~comments: array<Types.Comment.t>,
  unit,
) => React.element
