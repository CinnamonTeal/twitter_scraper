require "test_helper"

class TwitterScraperTest < Test::Unit::TestCase

	def test_get_user_date
		user = TwitterScraper.get_user("ryanmong")
		print user.inspect
		assert_equal("ryanmong", user["user"]["screen_name"])
	end
end