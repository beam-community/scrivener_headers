# Scrivener.Headers

[![Continuous Integration](https://github.com/beam-community/scrivener_headers/actions/workflows/ci.yaml/badge.svg)](https://github.com/beam-community/scrivener_headers/actions/workflows/ci.yaml)
[![Module Version](https://img.shields.io/hexpm/v/scrivener_headers.svg)](https://hex.pm/packages/scrivener_headers)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/scrivener_headers/)
[![Total Download](https://img.shields.io/hexpm/dt/scrivener_headers.svg)](https://hex.pm/packages/scrivener_headers)
[![License](https://img.shields.io/hexpm/l/scrivener_headers.svg)](https://github.com/beam-community/scrivener_headers/blob/master/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/beam-community/scrivener_headers.svg)](https://github.com/beam-community/scrivener_headers/commits/master)

Helpers for paginating API responses with [Scrivener](https://github.com/drewolson/scrivener) and HTTP headers.  Implements [RFC-5988](https://tools.ietf.org/html/rfc5988), the proposed standard for Web linking.

## Setup

Add `:scrivener_headers` to `mix.exs`:

```elixir
defp deps do
  [
    # ...
    {:scrivener_headers, "~> 3.2"}
    # ...
  ]
end
```

## Usage

With `Scrivener.Headers.paginate/2` we can easily set our pagination headers:

```elixir
def index(conn, params) do
  page = MyApp.Person
         |> where([p], p.age > 30)
         |> order_by([p], desc: p.age)
         |> preload(:friends)
         |> MyApp.Repo.paginate(params)

  conn
  |> Scrivener.Headers.paginate(page)
  |> render("index.json", people: page.entries)
end
```

With `curl --include` we can see our new headers:

```shell
$ curl --include 'https://localhost:4000/people?page=5'
HTTP/1.1 200 OK
Link: <http://localhost:4000/people?page=1>; rel="first",
  <http://localhost:4000/people?page=30>; rel="last",
  <http://localhost:4000/people?page=6>; rel="next",
  <http://localhost:4000/people?page=4>; rel="prev"
Total: 300
Per-Page: 10
```

### Using Custom Header Names

Override any number of pagination header names by passing opts with a `:header_keys` keyword list like so:

```elixir
Screenever.Headers.paginate(page,
  header_keys: [
    total: "total",
    link: "link",
    per_page: "per-page",
    total_pages: "total-pages",
    page_number: "page-number"
  ]
)
```

## Contributing

Contributions of all types are welcomed and encouraged.  Please
make appropriate use of [Issues][issues] and [Pull Requests][pulls].  All code
should have test coverage.

[issues]: https://github.com/beam-community/scrivener_headers/issues
[pulls]: https://github.com/beam-community/scrivener_headers/pulls


## Copyright and License

Copyright (c) 2016 Sean Callan

Released under the [MIT License](./LICENSE.md).
