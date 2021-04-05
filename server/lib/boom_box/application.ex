defmodule BoomBox.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BoomBox.Repo,
      # Start the Telemetry supervisor
      BoomBoxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BoomBox.PubSub},
      # Start the Endpoint (http/https)
      BoomBoxWeb.Endpoint
      # Start a worker by calling: BoomBox.Worker.start_link(arg)
      # {BoomBox.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BoomBox.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BoomBoxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
