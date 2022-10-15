# PhxStack.Umbrella

- move db config in dev to dev.secret

- add `.iex.exs` file

- server: true in runtime config (releases)

```elixir
# config/runtime.exs
config :phx_stack_web, PhxStackWeb.Endpoint, server: true
```

- add accent to web dependencies

`{:accent, "~> 1.1"}`

```elixir
defmodule PhxStackWeb.Router do
  use ApiWeb, :router
  alias PhoenixSwagger.Plug.Validate

  pipeline :api do
    plug :accepts, ["json"]
    plug(Validate, validation_failed_status: 422)
    plug Accent.Plug.Request, case: Accent.Case.Snake

    plug Accent.Plug.Response,
      default_case: Accent.Case.Camel,
      json_codec: Jason
  end
```

## CORS

- add cors to web dependencies `{:cors_plug, "~> 3.0"}`

```elixir
# endpoint.exs
plug CORSPlug, origin: "https://localhost:5002"
```
