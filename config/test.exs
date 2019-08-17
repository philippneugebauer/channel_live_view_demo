use Mix.Config

# Configure your database
config :channel_live_view_demo, ChannelLiveViewDemo.Repo,
  username: "postgres",
  password: "postgres",
  database: "channel_live_view_demo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :channel_live_view_demo, ChannelLiveViewDemoWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
