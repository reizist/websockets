class SocketController < WebsocketRails::BaseController 
  def new_message
    # コネクションのあるユーザー全てにメッセージを送る
    broadcast_message :new_message, message[:body]
  end
end
