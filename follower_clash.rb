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

puts "#{andy.username}'s follower count: #{andy.followers}"
puts "#{kendra.username}'s follower count: #{kendra.followers}"
# puts "#{tejas.username}'s follower count: #{tejas.followers}"
# puts "#{matt.username}'s follower count: #{matt.followers}"
# puts "#{don.username}'s follower count: #{don.followers}"
puts "#{andy.username}'s follower count: #{andy.following}"
puts "#{kendra.username}'s follower count: #{kendra.following}"

new_comparison = UserComparer::Comparer.new(andy, kendra)
new_comparison.compare_followers(andy, kendra)
new_comparison.compare_following(andy, kendra)
new_comparison.follow_ratio(andy, kendra)