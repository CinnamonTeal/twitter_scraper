# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "twitter_scraper/version"

Gem::Specification.new do |s|
  s.name        = "twitter_scraper"
  s.version     = TwitterScraper::VERSION
  s.authors     = ["CinnamonTeal"]
  s.email       = ["cinnamon_teal@fastmail.fm"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "twitter_scraper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "test-unit"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_runtime_dependency "httpclient"
end
