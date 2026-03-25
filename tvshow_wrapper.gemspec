# frozen_string_literal: true

require_relative "lib/tvshow_wrapper/version"

Gem::Specification.new do |spec|
  spec.name = "tvshow_wrapper"
  spec.version = TvshowWrapper::VERSION
  spec.authors = ["ddg"]
  spec.email = ["thewhiteless@yahoo.com"]

  spec.summary = "Ruby wrapper for TVMaze API"
  spec.description = "A simple project that is a Ruby wrapper for TVMaze API that allows to search TV shows by name and id, and to explore it's episodes."
  spec.homepage = "https://github.com/tvddg/ruby_tvshow_wrapper"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tvddg/ruby_tvshow_wrapper"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/])
    end
  end
  spec.executables = ["tvshow_wrapper"]
  spec.require_paths = ["lib"]
end
