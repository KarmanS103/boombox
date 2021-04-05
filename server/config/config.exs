# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :boom_box,
  ecto_repos: [BoomBox.Repo]

# Configures the endpoint
config :boom_box, BoomBoxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TT5Ll7ZeZw1o2g57FlsD/jX89tGJn2UHp1nDh5JNagrTKL+u/QxNj1vO2g6zGDlC",
  render_errors: [view: BoomBoxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BoomBox.PubSub,
  live_view: [signing_salt: "8i0VYHw9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
