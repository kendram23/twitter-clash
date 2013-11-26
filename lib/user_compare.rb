require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
	class User
		attr_reader :username

		def initialize(username)
			@username = username
		end

		def followers
			client = Twitter::REST::Client.new do |config|
				config.consumer_key 		    = ENV['CONSUMER_KEY']
				config.consumer_secret     = ENV['CONSUMER_SECRET']
				config.access_token			    = ENV['OAUTH_TOKEN']
				config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
			end

			client.user(@username).followers_count
		end
	end

	class Comparer
		
		def initialize(user1, user2, user3, user4, user5)
			@user1 = user1
			@user2 = user2
			@user3 = user3
			@user4 = user4
			@user5 = user5
		end

		def compare(user1, user2, user3, user4, user5)
			if user1.followers > user2.followers
				puts user1.username
			elsif user1.followers < user2.followers
				puts user2.username
			else
				puts "Users have the same number of followers"
			end
		end
	end
end