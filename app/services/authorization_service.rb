class AuthorizationService

  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  def get_user
    if @headers['Authorization'].present?
      User.get_user(verify_token.first["email"])
    else
      nil
    end
  end

  private

  def http_token
    if @headers['Authorization'].present?
      @headers['Authorization'].split(' ').last
    end
  end

  def verify_token
    JsonWebToken.verify(http_token, ENV["CLIENT_ID"])
  end
end