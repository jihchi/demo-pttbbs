type t<'data, 'error, 'mutate> = {
  data: 'data,
  error: 'error,
  isValidating: bool,
  mutate: 'mutate,
}

@module("swr") external useSWR: (string, 'fetcher) => t<'data, 'error, 'mutate> = "default"
