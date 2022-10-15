defmodule PhxStack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhxStack.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxStack.PubSub}
      # Start a worker by calling: PhxStack.Worker.start_link(arg)
      # {PhxStack.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: PhxStack.Supervisor)
  end
end
