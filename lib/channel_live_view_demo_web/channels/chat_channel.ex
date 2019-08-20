defmodule ChannelLiveViewDemoWeb.ChatChannel do
  use ChannelLiveViewDemoWeb, :channel

  alias ChannelLiveViewDemoWeb.Presence

  def join("chat", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_message", %{"sender" => sender, "message" => message}, socket) do
    # Message.create sender_id, receiver_id, message
    Presence.track(socket, sender, %{online_at: System.system_time(:second)})
    push socket, "online", Presence.list(socket)
    socket.endpoint.broadcast! "chat", "new_message", %{sender: sender, message: message}

    {:noreply, socket}
  end

end
