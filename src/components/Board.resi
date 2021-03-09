@react.component
let make: (
  ~isFallback: bool,
  ~posts: Result.t<array<Types.Post.t>, string>,
  unit,
) => React.element
