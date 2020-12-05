# app/lib/json_web_token.rb
require 'net/http'
require 'uri'

class JsonWebToken

  def self.get_token(code)
    url = URI("https://devchallenge.eu.auth0.com/oauth/token")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/json'
    request.body = {
      client_id: ENV["API_CLIENT_ID"],
      client_secret: ENV["API_CLIENT_SECRET"],
      audience: ENV["API_IDENTIFER"],
      grant_type: "authorization_code",
      code: code,
      redirect_uri: ENV["API_CALLBACK_URL"]
    }.to_json

    response = http.request(request)
    token = JSON.parse(response.body)["id_token"]
    user = self.verify(token, ENV["API_CLIENT_ID"])
    user ? {token: token, user: user} : nil
  end

  def self.verify(token, audience = ENV["API_IDENTIFER"])
    JWT.decode(token, nil,
               true, # Verify the signature of this token
               algorithm: 'RS256',
               iss: ENV["API_DOMAIN"],
               verify_iss: true,
               aud: audience,
               verify_aud: true) do |header|
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI("#{ENV["API_DOMAIN"]}.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    result = Hash[
      jwks_keys
      .map do |k|
        [
          k['kid'],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(k['x5c'].first)
          ).public_key
        ]
      end
    ]
    result
  end
end