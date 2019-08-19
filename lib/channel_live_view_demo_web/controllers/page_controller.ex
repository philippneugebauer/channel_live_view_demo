defmodule ChannelLiveViewDemoWeb.PageController do
  use ChannelLiveViewDemoWeb, :controller

  def live_view(conn, _params) do
    render(conn, "live_view.html")
  end

  def chat(conn, _params) do
    render(conn, "chat.html")
  end
end
