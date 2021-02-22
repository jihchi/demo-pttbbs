module Sort = {
  type t =
    | Asc
    | Desc
}

module Post = {
  type t = {
    bid: string,
    aid: string,
    owner: string,
    title: string,
    class: string,
  }
}

module Board = {
  type t = {
    bid: string,
    brdname: string,
    title: string,
    class: string,
  }
}
