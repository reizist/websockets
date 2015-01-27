#= require websocket_rails/main

class @ChatClass
  constructor: (url, useWebsocket) ->
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @events() # イベントを監視

  events: () =>
    # ボタンが押されたらメッセージを送信
    $('#button').on 'click', @submitMessage
    # サーバーからnew_messageを受け取った場合、receiveMessageを実行
    @dispatcher.bind 'new_message', @receiveMessage

  submitMessage: (event) =>
    # メッセージを取得し、サーバ側にnew_messageのイベントを送信
    msg_body = $('#text').val()
    console.log(msg_body)
    @dispatcher.trigger 'new_message', { body: msg_body }

  receiveMessage: (message) =>
    # 受け取ったメッセージを追加
    $('.message').append "<p class='left'>#{message}</p>"

$ ->
  window.chatClass = new ChatClass('localhost:3000/websocket', true)
