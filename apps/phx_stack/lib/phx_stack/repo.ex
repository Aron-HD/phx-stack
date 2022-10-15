defmodule PhxStack.Repo do
  use Ecto.Repo,
    otp_app: :phx_stack,
    adapter: Ecto.Adapters.Postgres
end
