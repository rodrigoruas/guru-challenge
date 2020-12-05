class SecuredController < ApplicationController
  before_action :authorize_request
  before_action :get_user_from_token
  

  private

  def get_user_from_token
    @user = AuthorizationService.new(request.headers).get_user
  end

  def authorize_request
    AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end