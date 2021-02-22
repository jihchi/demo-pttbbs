type props = {post: Types.Post.t, comments: array<Types.Comment.t>}
type params = {board: string, slug: string}

let default: props => React.element

let getServerSideProps: Next.GetServerSideProps.t<props, params, _>
