// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import {Presence, Socket} from "phoenix"
import $ from "jquery"

let socket = new Socket("/socket", {})
let chatChannel = socket.channel("chat", {})
let presence = new Presence(chatChannel)

function showOnlineStatus(presence) {
  let chatOnlineList = document.getElementById('chat-online-list')
  while (chatOnlineList.firstChild) {
    chatOnlineList.removeChild(chatOnlineList.firstChild);
  }
  presence.list((name, { metas: [first, ...rest] }) => {
    let div = document.createElement("div")
    div.textContent = name
    div.classList.add("chatter")
    chatOnlineList.appendChild(div)
  })
}

socket.connect()

presence.onSync(() => showOnlineStatus(presence))

chatChannel.join()

if($('chat-send-button').length) {
  document.getElementById('chat-send-button').addEventListener('click', function (e) {
    e.preventDefault()

    let chatMessageInput = document.getElementById('chat-message')
    let message = chatMessageInput.value
    chatMessageInput.value = ''
    let userName = document.getElementById('chat-send-button').getAttribute("user-name")
    chatChannel.push("new_message", { "sender": userName, "message": message }, socket)
  })
}

chatChannel.on("new_message", response => {
  let chat = document.getElementById('chat-text')

  let div = document.createElement("div")
  let leftSpan = document.createElement("span")
  leftSpan.textContent = response.sender
  div.appendChild(leftSpan)
  let rightSpan = document.createElement("span")
  rightSpan.textContent = response.message
  div.appendChild(rightSpan)

  div.classList.add("chat-message")

  chat.appendChild(div)
})

export default socket
