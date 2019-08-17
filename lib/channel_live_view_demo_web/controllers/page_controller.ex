defmodule ChannelLiveViewDemoWeb.PageController do
  use ChannelLiveViewDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
