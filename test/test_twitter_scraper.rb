require "test_helper"

class TwitterScraperTest < Test::Unit::TestCase

	def test_get_user_date
		user = TwitterScraper.get_user("ryanmong")
		assert_equal("ryanmong", user["user"]["screen_name"])
	end

	def test_get_followers
		followers = TwitterScraper.get_followers("ryanmong")
		assert(followers.size > 0)
	end

	def test_get_friends
		friends = TwitterScraper.get_friends("ryanmong")
		assert(friends.size > 0)
	end

	def test_get_similar_friends
		similar_friends = TwitterScraper.get_similar_friends("ryanmong","binghott")
		andy = similar_friends.select { |user| user["screen_name"] == "AndySecretStash" }.first
		assert(andy)
	end
end