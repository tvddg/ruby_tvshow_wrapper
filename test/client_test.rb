require_relative 'test_helper'

class ClientTest < Minitest::Test
  def setup
    @client = TvshowWrapper.client
  end

  def test_search_returns_shows
    fake_response = [
      { "show" => { "id" => 1, "name" => "Test Show", "genres" => ["Drama"], "rating" => { "average" => 8.5 } } }
    ]

    original = TvshowWrapper::Request.method(:get)

    TvshowWrapper::Request.define_singleton_method(:get) { |*args| fake_response }

    shows = @client.search("test")
    assert_instance_of Array, shows
    assert_instance_of TvshowWrapper::Show, shows.first
    assert_equal "Test Show", shows.first.name

    TvshowWrapper::Request.define_singleton_method(:get, original)
  end

  def test_find_returns_show
    fake_response = {
      "id" => 1,
      "name" => "Test Show",
      "genres" => ["Drama"],
      "rating" => { "average" => 8.5 }
    }

    original = TvshowWrapper::Request.method(:get)
    TvshowWrapper::Request.define_singleton_method(:get) { |*args| fake_response }

    show = @client.find(1)
    assert_instance_of TvshowWrapper::Show, show
    assert_equal 1, show.id

    TvshowWrapper::Request.define_singleton_method(:get, original)
  end

  def test_episodes_returns_array_of_episodes
    fake_response = [
      { "name" => "Ep1", "season" => 1, "number" => 1 },
      { "name" => "Ep2", "season" => 1, "number" => 2 }
    ]

    original = TvshowWrapper::Request.method(:get)
    TvshowWrapper::Request.define_singleton_method(:get) { |*args| fake_response }

    episodes = @client.episodes(1)
    assert_instance_of Array, episodes
    assert_instance_of TvshowWrapper::Episode, episodes.first
    assert_equal "Ep1", episodes.first.name

    TvshowWrapper::Request.define_singleton_method(:get, original)
  end
end