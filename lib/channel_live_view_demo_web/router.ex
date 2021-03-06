defmodule ChannelLiveViewDemoWeb.Router do
  use ChannelLiveViewDemoWeb, :router

  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChannelLiveViewDemoWeb do
    pipe_through :browser

    get "/", PageController, :live_view
    get "/chat", PageController, :chat
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChannelLiveViewDemoWeb do
  #   pipe_through :api
  # end
end
