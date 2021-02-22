module Sort = {
  type t =
    | Asc
    | Desc
}

module Post = {
  type t = {
    bid: string,
    aid: string,
    deleted: bool,
    create_time: int,
    modified: int,
    owner: string,
    title: string,
    class: string,
    read: bool,
  }
}
