require_relative 'test_helper'

class IntegrationTest < Minitest::Test
  def setup
    @client = TvshowWrapper.client
  end

  def test_real_search
    shows = @client.search("Breaking Bad")

    assert_instance_of Array, shows
    refute_empty shows
    assert_instance_of TvshowWrapper::Show, shows.first
  end

  def test_real_find
    show = @client.find(82)

    assert_instance_of TvshowWrapper::Show, show
    assert_equal 82, show.id
  end

  def test_real_episodes
    episodes = @client.episodes(82)

    assert_instance_of Array, episodes
    refute_empty episodes
    assert_instance_of TvshowWrapper::Episode, episodes.first
  end

  def test_not_found_error
    assert_raises(TvshowWrapper::Error) do
      @client.find(999999999)
    end
  end
end