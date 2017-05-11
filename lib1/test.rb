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

  def search(response)
    array = client.search(response, options = {result_type: "popular"}).take(10)
    tweets = parse_tweet_data(array)
  end

  def parse_tweet_data(array)
    tweets = []
    num = 1
    array.each do |x|
      string = "#{num}. ".red + " #{x.user.name}" + " @#{x.user.screen_name}\n" + " Tweet: ".red + "#{x.text}" + "\n Date/Time:".red + " #{x.created_at} \n" + " Retweets: #{x.retweet_count} |" + " Likes: " + " #{x.favorite_count} | Followers: #{x.user.followers_count}\n  "
      tweets << string
      num += 1
    end
    tweets = "Sorry that's not a topic we have info on at the moment, please try again\n  ".red if tweets.size == 0
    tweets
  end
end
