open Twind
module Link = Next.Link

module Navigation = {
  @react.component
  let make = () =>
    <nav
      className={tw([
        "p-2",
        "h-12",
        "flex",
        "border-b",
        "border-gray-200",
        "justify-between",
        "items-center",
        "text-sm",
      ])}>
      <Link href="/">
        <a className={tw(["flex", "items-center", "w-1/3"])}>
          <span className={tw(["text-xl", "ml-2", "align-middle", "font-semibold"])}>
            {React.string("PTT")}
          </span>
        </a>
      </Link>
      <div className={tw(["flex", "w-2/3", "justify-end"])}>
        <Link href="/"> <a className={tw(["px-3"])}> {React.string("Home")} </a> </Link>
        <Link href="/trending/boards">
          <a className={tw(["px-3"])}> {React.string("Trending Boards")} </a>
        </Link>
        <a
          className={tw(["px-3", "font-bold"])}
          target="_blank"
          href="https://github.com/Ptt-official-app/demo-pttbbs">
          {React.string("Github")}
        </a>
      </div>
    </nav>
}

@react.component
let make = (~children) => {
  <>
    <Meta />
    <div className={tw(["flex", "lg:justify-center"])}>
      <div className={tw(["max-w-5xl", "w-full", "lg:w-3/4", "text-gray-900", "text-base"])}>
        <Navigation /> <main className={tw(["mt-4", "mx-4"])}> children </main>
      </div>
    </div>
  </>
}
