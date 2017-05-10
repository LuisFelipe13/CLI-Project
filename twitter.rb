require 'twitter'
require 'yaml'
require "pry"
require "colorize"

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end

  def most_recent_friend
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
    client.friends.first.name
  end

  def find_user_for(username)
    #find the twitter gem method that returns the correct user, given a username
    client.user(username).name
  end

  def find_followers_for(username)
    #find the twitter gem method that returns the follows of a given user
    array = client.followers(username).take(10)
    names = []
    array.each do |x|
      names << x.name
    end
    names
  end

  def homepage_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
    array = client.home_timeline
    tweets = []
    array.each do |x|
      tweets << x.text
    end
    tweets
  end

  def search
    q = "miami"
    array = client.search(q, options = {result_type: "popular"}).take(10)
    tweets = []
    num = 1
    array.each do |x|
      string = "#{num}. #{x.user.name}" + "@#{x.user.screen_name}\n" + "#{x.text}".light_cyan + "\n #{x.created_at} \n Retweets: #{x.retweet_count} |" + " Likes: #{x.favorite_count}"
      tweets << string
      num += 1
    end
    tweets

  end
end

tweet_client = TwitterApi.new
puts tweet_client.search
