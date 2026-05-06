module TvshowWrapper
  class Show
    attr_reader :id, :name, :summary, :image, :genres, :rating

    def initialize(attrs)
      @id      = attrs["id"]
      @name    = attrs["name"]
      @summary = prepare(attrs["summary"])
      @image   = attrs.dig("image", "original")
      @genres  = attrs["genres"]
      @rating  = attrs.dig("rating", "average")
    end

    def to_s
      "#{id}. #{name} (#{rating || "N/A"}) #{ genres.any? ? "- #{genres.join(", ") }" : "N/A" }\n#{summary || "N/A"}\nImage URL: #{image || "N/A"}"
    end

    def prepare(text)
        return nil if text.nil? || text.strip.empty?

        text
        .gsub(/<[^>]*>/, '')   
        .gsub('&amp;', '&')
        .gsub('&nbsp;', ' ')
        .strip
        .split(".")
        .first(3)
        .join(".") + "."
    end
  end
end