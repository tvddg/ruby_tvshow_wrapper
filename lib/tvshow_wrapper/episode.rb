module TvshowWrapper
  class Episode
    attr_reader :name, :season, :number

    def initialize(attrs)
      @name   = attrs["name"]
      @season = attrs["season"]
      @number = attrs["number"]
    end

    def to_s
      "S#{season}E#{number} - #{name}"
    end
  end
end