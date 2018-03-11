class AuthController < ApplicationController
  # before_action :only_for_anonymous # 既知のユーザーかどうかをチェック

  def new; end

  # paramsからusernameを取得し、sessionに保存してチャットにリダイレクトする
  def create
    session[:username] = params[:username]
    redirect_to root_path
  end

  private

  # ユーザーが以前チャットしたことがある場合はそのままチャットウィンドウにリダイレクト
  def only_for_anonymous
    redirect_to root_path if session[:username]
  end
end
