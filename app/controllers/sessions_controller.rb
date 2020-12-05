class SessionsController < ApplicationController
  def create
    decoded_token = JsonWebToken.get_token(params[:code])
    email = decoded_token[:user].first["email"]
    user = User.get_user(email)
    if user
      current_user = user
    else
      User.create(
        email: email
      )
    end
    render json: {
      token: decoded_token[:token],
      status: "authenticated"
    }
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end