require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
	class User
		attr_reader :username

		def initialize(username)
			@username = username
			@client = Twitter::REST::Client.new do |config|
				config.consumer_key 	   = ENV['CONSUMER_KEY']
				config.consumer_secret     = ENV['CONSUMER_SECRET']
				config.access_token		   = ENV['OAUTH_TOKEN']
				config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
			end
		end

		def followers
			@client.user(@username).followers_count
		end

		def following
			@client.user(@username).friends_count
		end

		def display_name
			@client.user(@username).name
		end

		def tweets
			@client.user(@username).statuses_count
		end

	end

	class Comparer
		
		def initialize(user1, user2)
			@user1 = user1
			@user2 = user2
		end

		def compare_followers(user1, user2)
			if user1.followers > user2.followers
				puts "#{user2.display_name} has more followers"
			elsif user1.followers < user2.followers
				puts "#{user2.display_name} has more followers"
			else
				puts "Users have the same number of followers"
			end
		end

		def compare_following(user1, user2)
			if user1.following > user2.following
				puts "#{user1.display_name} is following more users"
			elsif user1.following < user2.following
				puts "#{user2.display_name} is following more users"
			else
				puts "Users are following the same number of people"
			end
		end

		def compare_tweets(user1, user2)
			if user1.tweets > user2.tweets
				puts "#{user1.display_name} has more tweets"
			elsif user1.tweets < user2.tweets
				puts "#{user2.display_name} has more tweets"
			else
				puts "Users have the same number of tweets"
			end

		end

		def follow_ratio(user1, user2)
			user1_ratio = (user1.followers/user2.following) * 100
			puts "#{user1.display_name} has a ratio of #{user1_ratio} followers to following"
			user2_ratio = user2.followers/user2.following
			puts "#{user2.display_name} has a ratio of #{user2_ratio} followers to following"
		end
	end
end