require 'twitter'
require './configure'

screen_name = ARGV[0] || 'diego_aguilar'
a_user = Twitter.user(screen_name)

puts "Username   : #{a_user.screen_name}"
puts "Name       : #{a_user.name}"
puts "Followers  : #{a_user.followers_count}"
puts "Friends    : #{a_user.friends_count}"
puts "Location   : #{a_user.location}"
puts "URL        : #{a_user.url}" if a_user.url
puts "Verified   : #{a_user.verified}"
puts

tweet = Twitter.user_timeline(screen_name).first

if tweet
  puts "Tweet text : #{tweet.text }"
  puts "Tweet time : #{tweet.created_at}"
  puts "Tweet ID   : #{tweet.id}"
end
