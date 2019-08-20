defmodule ChannelLiveViewDemo.SearchLive do
  use Phoenix.LiveView

  import Ecto.Query

  alias ChannelLiveViewDemo.Repo
  alias ChannelLiveViewDemo.User

  def render(assigns) do
    ChannelLiveViewDemo.SearchView.render("search_live.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, query: nil, result: nil, loading: false, matches: [])}
  end

  def handle_event("suggest", %{"q" => query}, socket) when byte_size(query) <= 100 do
    matches = Repo.all from u in User, where: ilike(u.name, ^"%#{query}%")
    {:noreply, assign(socket, matches: Enum.map(matches, fn m -> m.name end))}
  end

  def handle_event("search", %{"q" => query}, socket) when byte_size(query) <= 100 do
    send(self(), {:search, query})
    {:noreply, assign(socket, query: query, result: "Searching...", loading: true, matches: [])}
  end

  def handle_info({:search, query}, socket) do
    result = Repo.one from u in User, where: u.name == ^query
    {:noreply, assign(socket, loading: false, result: result.name, matches: [])}
  end
end
