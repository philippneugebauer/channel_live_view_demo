defmodule ChannelLiveViewDemo.SearchLive do
  use Phoenix.LiveView

  def render(assigns) do
    ChannelLiveViewDemo.SearchView.render("search_live.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, query: nil, result: nil, loading: false, matches: [])}
  end

  def handle_event("suggest", %{"q" => query}, socket) when byte_size(query) <= 100 do
    {words, _} = System.cmd("grep", ~w"^#{query}.* -m 5 /usr/share/dict/words")
    {:noreply, assign(socket, matches: String.split(words, "\n"))}
  end

  def handle_event("search", %{"q" => query}, socket) when byte_size(query) <= 100 do
    send(self(), {:search, query})
    {:noreply, assign(socket, query: query, result: "Searching...", loading: true, matches: [])}
  end

  def handle_info({:search, query}, socket) do
    {result, _} = System.cmd("dict", ["#{query}"], stderr_to_stdout: true)
    {:noreply, assign(socket, loading: false, result: result, matches: [])}
  end
end
