module Head = Next.Head

@react.component
let make = (~title="Ptt") => {
  <Head>
    <title key="title"> {React.string(title)} </title>
    <meta charSet="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, minimal-ui"
    />
  </Head>
}
