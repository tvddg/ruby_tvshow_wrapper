require_relative "tvshow_wrapper/request"
require_relative "tvshow_wrapper/client"
require_relative "tvshow_wrapper/show"
require_relative "tvshow_wrapper/episode"
require_relative "tvshow_wrapper/errors"

module TvshowWrapper
  def self.client
    @client ||= Client.new
  end
end
