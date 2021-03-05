type pageProps = {.}
type pageComponent = React.component<{.}>

type props = {
  "Component": pageComponent,
  "pageProps": pageProps,
}

// We are not using `[@react.component]` since we will never use this <App />
// within our ReScript code. It's only used within `pages/_app.js`.
let default = (props: props): React.element => {
  let component = props["Component"]
  let pageProps = props["pageProps"]
  let router = Next.Router.useRouter()
  let content = React.createElement(component, pageProps)
  switch router.route {
  | _ =>
    <MainLayout>
      <div className="flex justify-center"> <div className="max-w-705 w-full"> content </div> </div>
    </MainLayout>
  }
}
