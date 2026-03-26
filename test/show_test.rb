require_relative 'test_helper'

class ShowTest < Minitest::Test
  def setup
    attrs = {
      "id" => 1,
      "name" => "Breaking Bad",
      "genres" => ["Drama"],
      "rating" => { "average" => 9.5 }
    }
    @show = TvshowWrapper::Show.new(attrs)
  end

  def test_attributes
    assert_equal 1, @show.id
    assert_equal "Breaking Bad", @show.name
    assert_includes @show.genres, "Drama"
    assert_equal 9.5, @show.rating
  end

  def test_to_s
    assert_equal "1. Breaking Bad (9.5) - Drama", @show.to_s
  end
end