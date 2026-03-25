module TvshowWrapper
  class Client
    def search(query)
      data = Request.get("/search/shows", q: query)

      data.map do |item|
        Show.new(item["show"])
      end
    end

    def find(id)
      data = Request.get("/shows/#{id}")
      Show.new(data)
    end

    def episodes(show_id)
      data = Request.get("/shows/#{show_id}/episodes")

      data.map do |ep|
        Episode.new(ep)
      end
    end
  end
end