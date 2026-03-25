require 'net/http'
require 'json'
require 'uri'

module TvshowWrapper
  class Request
    BASE_URL = "https://api.tvmaze.com/"

    def self.get(path, params = {})
      uri = URI(BASE_URL + path)
      uri.query = URI.encode_www_form(params) unless params.empty?

      response = Net::HTTP.get_response(uri)

      unless response.is_a?(Net::HTTPSuccess)
        raise Error, "HTTP Error: #{response.code}"
      end

      JSON.parse(response.body)
    end
  end
end