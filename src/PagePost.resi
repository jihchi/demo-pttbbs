type props
type params
let default: props => React.element
let getStaticPaths: Next.GetStaticPaths.t<params>
let getStaticProps: Next.GetStaticProps.t<props, params, _>
