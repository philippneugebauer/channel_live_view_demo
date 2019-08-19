defmodule ChannelLiveViewDemo.Presence do
  use Phoenix.Presence, otp_app: :channel_live_view_demo, pubsub_server: ChannelLiveViewDemo.PubSub
end
