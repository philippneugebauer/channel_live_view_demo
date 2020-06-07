# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :channel_live_view_demo,
  ecto_repos: [ChannelLiveViewDemo.Repo]

# Configures the endpoint
config :channel_live_view_demo, ChannelLiveViewDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y3KK5g8RnogLh/m7Gs3hw2z7AXryMgYNhuNR+pAMZrOrhCvOBfCCSEXPn/HxjPxv",
  render_errors: [view: ChannelLiveViewDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: ChannelLiveViewDemo.PubSub,
  live_view: [
    signing_salt: "UzW35rmJbC6VxuDkfenyLXxAsZK7TQme"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
