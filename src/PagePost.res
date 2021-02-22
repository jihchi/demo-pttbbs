type props = {
  board: string,
  slug: string,
}

let default = (props: props) => <Post board=props.board slug=props.slug />
