// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import $ from "jquery"
import jQuery from 'jquery'
import popper from 'popper.js'
import bootstrap from 'bootstrap'

// Import local files
//
// Local files can be imported directly using relative paths, for example:

import socket from "./socket"
import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, { params: { _csrf_token: csrfToken } })
liveSocket.connect()

$(function () {
  if ($("#user-name-modal").length) {
    $('#user-name-modal').modal('show');
  }
})

$(document).on('click', '#user-name-set-button', function () {
  let userName = $("#user-name-input").val()
  $("#chat-send-button").attr("user-name", userName)

  $('#user-name-modal').modal('hide')
});
