require_relative 'test_helper'

class EpisodeTest < Minitest::Test
  def setup
    attrs = { "name" => "Pilot", "season" => 1, "number" => 1 }
    @episode = TvshowWrapper::Episode.new(attrs)
  end

  def test_attributes
    assert_equal "Pilot", @episode.name
    assert_equal 1, @episode.season
    assert_equal 1, @episode.number
  end

  def test_to_s
    assert_equal "S1E1 - Pilot", @episode.to_s
  end
end