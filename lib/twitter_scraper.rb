require "twitter_scraper/version"
require "httpclient"
require "json"

module TwitterScraper
	def self.get_user(screen_name)
		JSON[client.get("http://twitter.com/users/show_for_profile.json?screen_name=#{screen_name}").body]
	end

	private

	def self.client
		@@client ||= HTTPClient.new
	end
end
