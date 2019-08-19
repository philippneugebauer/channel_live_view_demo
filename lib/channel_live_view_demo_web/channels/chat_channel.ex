defmodule ChannelLiveViewDemoWeb.ChatChannel do
  use ChannelLiveViewDemoWeb, :channel

  def join("chat", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_message", %{"sender" => sender, "message" => message}, socket) do
    # Message.create sender_id, receiver_id, message
    socket.endpoint.broadcast! "chat", "new_message", %{sender: sender, message: message}

    {:noreply, socket}
  end

end
