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

  def search(topic)
    array = client.search(topic, options = {result_type: "popular"}).take(10)
    tweets = parse_tweet_data(array)
  end

  def specific_search(topic, location)
    array = client.search(topic, options = {result_type: "recent", geocode: "#{location[0]},#{location[1]},5mi"}).take(10)
    tweets = parse_tweet_data(array)
  end

  def parse_tweet_data(array)
    tweets = []
    num = 1
    array.each do |x|
      string = "#{num}.".red + "#{x.user.name}" + " @#{x.user.screen_name}\n" + " Tweet: " + "#{x.text}" + "\n Date/Time:" + " #{x.created_at} \n" + " Retweets: #{x.retweet_count} |" + " Likes: " + " #{x.favorite_count} | Followers: #{x.user.followers_count}\n  "
      tweets << string
      num += 1
    end
    tweets = "Sorry that's not trending, please try again\n  ".red if tweets.size == 0
    puts tweets
  end
end
