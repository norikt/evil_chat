class ChatController < ApplicationController
  before_action :authenticate!

  # 最新メッセージを20件表示
  def show
    @messages = Message.order(created_at: :asc).last(20)
  end

  private

  # ユーザーがusernameを指定しなかった場合/loginにリダイレクト
  def authenticate!
    redirect_to login_path unless session[:username]
  end
end
