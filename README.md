# TvshowWrapper

TvshowWrapper is a simple Ruby gem that provides a convenient wrapper around the TVMaze for working with TV shows.
The gem allows you to:
- search for shows by name
- fetch show details by ID
- retrieve a list of episodes
It abstracts away HTTP requests and JSON parsing, giving you a clean Ruby interface.


## Usage

### Initialize client
```ruby
require 'tvshow_wrapper'

client = TvshowWrapper.client
```

### Search for shows
```ruby
shows = client.search("Breaking Bad")

shows.each do |show|
  puts show
end
```

Example output
```1. Breaking Bad (9.5) - Drama```

### Find show by ID
```Ruby
show = client.find(82)

puts show.name # => "Sherlock"
```

### Get episodes
```Ruby
episodes = client.episodes(82)

episodes.each do |episode|
  puts episode
end
```

Example output:
```
S1E1 - A Study in Pink
S1E2 - The Blind Banker
```

### Error handling
```Ruby
begin
  client.find(999999999)
rescue TvshowWrapper::Error => e
  puts "Error: #{e.message}"
end
```

### CLI usage
```Bash
bin/tvshow_wrapper search "Breaking Bad"
bin/tvshow_wrapper show 82
bin/tvshow_wrapper episodes 82
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tvddg/tvshow_wrapper.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
