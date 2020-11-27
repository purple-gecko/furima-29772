class ApplicationController < ActionController::Base
  # ユーザー認証
  before_action :basic_auth

  # 動作確認用アクション
  def hello
    render html: "hello, world!"
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end