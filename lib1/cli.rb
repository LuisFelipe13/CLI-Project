class CLI
  def welcome
    puts "Welcome to TweetTrend, the only command line app you'll ever need to see what's trending!"
    puts "Enter a twitter topic (for example, politics) and I'll be more than happy to show you what's trending:"
    response = gets.chomp
    tweet_client = TwitterApi.new
    puts tweet_client.search(response)
    continue
  end

  def continue
    puts "^ Tweets ^ Above ^ \n Enter a new topic to see what's trending:"
    response = gets.chomp
    tweet_client = TwitterApi.new
    puts tweet_client.search(response)
    continue
  end
end
