class AuthorizationService

  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  private

  def http_token
    if @headers['Authorization'].present?
      @headers['Authorization'].split(' ').last
    end
  end

  def verify_token
    begin
      JsonWebToken.verify(http_token)
    rescue => e
      # byebug
    end
  end

end