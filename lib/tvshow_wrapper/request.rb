require 'net/http'
require 'json'
require 'uri'
require 'openssl'

module TvshowWrapper
  class Request
    BASE_URL = "https://api.tvmaze.com"

    def self.get(path, params = {})
      uri = URI(BASE_URL + path)
      uri.query = URI.encode_www_form(params) unless params.empty?
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true;

      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      
      response = Net::HTTP.get_response(uri)

      unless response.is_a?(Net::HTTPSuccess)
        raise Error, "HTTP Error: #{response.code}"
      end

      JSON.parse(response.body)
    end
  end
end