require_relative 'lib/user_compare.rb'

require_relative 'lib/user_compare.rb'

andy = UserComparer::User.new('AusinAus')
puts andy

kendra = UserComparer::User.new('kendram23')
puts kendra

# tejas = UserComparer::User.new('tejasrawal90')
# puts tejas

# matt = UserComparer::User.new('LarshMatt')
# puts matt

# don = UserComparer::User.new('DonDrums')
# puts don

new_comparison = UserComparer::Comparer.new(andy, kendra)

puts ""
puts "------------  Follower Count  -----------------"
puts "#{andy.display_name}'s follower count: #{andy.followers}"
puts "#{kendra.display_name}'s follower count: #{kendra.followers}"
new_comparison.compare_followers(andy, kendra)

puts ""
puts "------------  Following Count  -----------------"
puts "#{andy.display_name}'s following count: #{andy.following}"
puts "#{kendra.display_name}'s following count: #{kendra.following}"
new_comparison.compare_following(andy, kendra)

puts ""
puts "------------  Tweet Count  -----------------"
puts "#{andy.display_name}'s tweet count: #{andy.following}"
puts "#{kendra.display_name}'s tweet count: #{kendra.following}"
new_comparison.compare_tweets(andy, kendra)

puts ""
puts "--------  Follower/Following Ratio  --------"
new_comparison.follow_ratio(andy, kendra)

puts ""
puts "----------  Last Tweet by User  ------------"
new_comparison.post_tweet(andy, kendra)





