class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
  end

  # サーバーがメッセージ形式のコンテンツを受け取ると呼び出される
  def send_message(payload)
    message = Message.new(author: current_user, text: payload["message"])
    if message.save
      ActionCable.server.broadcast "chat", message: render(message)
    end
  end

  private

  def render(message)
    ApplicationController.new.helpers.c("message", message: message)
  end
end
