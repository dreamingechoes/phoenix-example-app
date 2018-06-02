# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_example_app,
  ecto_repos: [PhoenixExampleApp.Repo]

# Configures the endpoint
config :phoenix_example_app, PhoenixExampleAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "VvoE2ECdd7kSgKnMrbxl3qyBCO9kPPOcu7daljna798IkCNeD9rn13GcdZ3o9vG1",
  render_errors: [view: PhoenixExampleAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixExampleApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Guardian configuration
config :phoenix_example_app, PhoenixExampleApp.Guardian,
  issuer: "phoenix_example_app",
  secret_key: "eP/Fjhc5Ns4WsmYqBqwvC51oA0i/aXYeobBLn8V7Rrtyddfct48rimYbVQj28MAX"

config :phoenix_example_app, PhoenixExampleAppWeb.AuthPipeline,
  module: PhoenixExampleAppWeb.Guardian,
  error_handler: PhoenixExampleAppWeb.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
