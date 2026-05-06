require_relative 'test_helper'

class ShowTest < Minitest::Test
  def setup
    attrs = {
      "id" => 1,
      "name" => "Breaking Bad",
      "summary" => "<p><b>Breaking Bad</b> follows protagonist Walter White, a chemistry teacher who lives in New Mexico with his wife and teenage son who has cerebral palsy.</p>",
      "image" => { "original" => "/some/url/blablabla"},
      "genres" => ["Drama"],
      "rating" => { "average" => 9.5 }
    }
    @show = TvshowWrapper::Show.new(attrs)
  end

  def test_attributes
    assert_equal 1, @show.id
    assert_equal "Breaking Bad", @show.name
    assert_equal "Breaking Bad follows protagonist Walter White, a chemistry teacher who lives in New Mexico with his wife and teenage son who has cerebral palsy.", @show.summary
    assert_equal "/some/url/blablabla", @show.image
    assert_includes @show.genres, "Drama"
    assert_equal 9.5, @show.rating
  end

  def test_to_s
    assert_equal "1. Breaking Bad (9.5) - Drama\nBreaking Bad follows protagonist Walter White, a chemistry teacher who lives in New Mexico with his wife and teenage son who has cerebral palsy.\nImage URL: /some/url/blablabla", @show.to_s
  end
end