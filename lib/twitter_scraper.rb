require "twitter_scraper/version"
require "httpclient"
require "json"
require "pry"
module TwitterScraper

	class << self
		def get_user(screen_name)
			JSON[client.get("http://twitter.com/users/show_for_profile.json?screen_name=#{screen_name}").body]
		end

		def get_friends(screen_name)
			ids = JSON[client.get("http://api.twitter.com/1/friends/ids.json?screen_name=#{screen_name}").body]["ids"]
			users = {}
			ids.each_slice(100) do |ids_slice|
				JSON[client.get("http://api.twitter.com/1/users/lookup.json?user_id=#{ids_slice.join(',')}").body].each do |user|
					users[user["screen_name"]] = user
				end
			end
			users
		end

		def get_followers(screen_name)
			ids = JSON[client.get("http://api.twitter.com/1/followers/ids.json?screen_name=#{screen_name}").body]["ids"]
			users = JSON[client.get("http://api.twitter.com/1/users/lookup.json?user_id=#{ids.join(',')}").body]
		end

		def get_similar_friends(source_screen_name, target_screen_name)
			source_friends = get_friends(source_screen_name)
			target_friends = get_friends(target_screen_name)
			shared_friends = source_friends.keys & target_friends.keys
			source_friends.values_at(*shared_friends)
		end

		private

		def client
			@@client ||= HTTPClient.new
		end
	end
end