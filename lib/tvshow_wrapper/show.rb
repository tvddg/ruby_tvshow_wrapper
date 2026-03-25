module TvshowWrapper
  class Show
    attr_reader :id, :name, :genres, :rating

    def initialize(attrs)
      @id     = attrs["id"]
      @name   = attrs["name"]
      @genres = attrs["genres"]
      @rating = attrs.dig("rating", "average")
    end

    def to_s
      "#{id}. #{name} (#{rating || "N/A"}) #{ genres.any? ? "- #{genres.join(", ") }" : "N/A" }"
    end
  end
end