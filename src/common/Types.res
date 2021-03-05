module Sort = {
  type t =
    | Asc
    | Desc
}

module Board = {
  type t = {
    bid: string,
    brdname: string,
    title: string,
    class: string,
  }
}

module Post = {
  type t = {
    bid: string,
    aid: string,
    owner: string,
    title: string,
    class: string,
    brdname: string,
  }
}

module Content = {
  type color = {
    foreground: int,
    background: int,
    blink: bool,
    highlight: bool,
    reset: bool,
  }

  type t = {
    text: string,
    color0: color,
    color1: color,
  }
}

module Comment = {
  type t = {
    bid: string,
    aid: string,
    cid: string,
    owner: string,
    content: array<array<Content.t>>,
  }
}
