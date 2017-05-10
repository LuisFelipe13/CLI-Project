require 'twitter'
require 'yaml'
require "pry"

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
    client.friends.first
  end

  def find_user_for(username)
    #find the twitter gem method that returns the correct user, given a username
    client.user(username)
  end

  def find_followers_for(username)
    #find the twitter gem method that returns the follows of a given user
    array = client.followers(username).take(10)
  end

  def homepage_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
    array = client.home_timeline
  end

  def search
    client.search(q, options = {})
  end
end

puts most_recent_friend
