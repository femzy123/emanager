# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :eventmanager,
  ecto_repos: [Eventmanager.Repo]

# Configures the endpoint
config :eventmanager, EventmanagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a62SL1nfFYEmOyYrfYj4h/s40AKG02r7TpIJrurYa863QuPFVxEv92vPbXQQRTfu",
  render_errors: [view: EventmanagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Eventmanager.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  # configure pow
  config :eventmanager, :pow,
    user: Eventmanager.Users.User,
    repo: Eventmanager.Repo

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
