class CLI
  def welcome
    puts "Welcome to TweetTrend, the only command line app you'll ever need to see what's trending!"
    puts "Enter a twitter topic (for example, politics) and I'll be more than happy to show you what's trending:"
    @response = gets.chomp
    @response = @response.downcase
    get_tweets
  end

  def get_tweets
    if @response == Topic.check_for_topic(@response) # => check to see if users topic is available
      Topic.show_tweets(@response) # => returns an array of the trending tweets from the users topic
    else
      puts "Sorry that's not a topic we have info on at the moment, please try again"
      welcome
    end
  end
end
