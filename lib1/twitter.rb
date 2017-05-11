# require 'twitter'
# require 'yaml'
# require "pry"
# require "colorize"

# class TwitterApi
#   attr_reader :client
#
#   def initialize
#     keys = YAML.load_file('application.yml')
#     @client = Twitter::REST::Client.new do |config|
#       config.consumer_key        = keys['CONSUMER_KEY']
#       config.consumer_secret     = keys['CONSUMER_SECRET']
#       config.access_token        = keys['ACCESS_TOKEN']
#       config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
#     end
#   end
#
#   def search(response)
#     array = client.search(response, options = {result_type: "popular"}).take(10)
#     tweets = []
#     num = 1
#     array.each do |x|
#       string = "#{num}. #{x.user.name}".red + " @#{x.user.screen_name}\n".red + " Tweet: #{x.text}".light_cyan + "\n Date/Time: #{x.created_at} \n Retweets: #{x.retweet_count} |" + " Likes: #{x.favorite_count} | Followers: #{x.user.followers_count}"
#       tweets << string
#       num += 1
#     end
#     tweets = "Sorry that's not a topic we have info on at the moment, please try again" if tweets.size == 0
#     tweets
#   end
# end
