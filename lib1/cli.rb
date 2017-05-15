class CLI
  @@doh = Artii::Base.new :font => 'doh'
  @@calgphy2 = Artii::Base.new :font => 'calgphy2'
  @@slant = Artii::Base.new :font => 'slant'
  @@doom =  Artii::Base.new :font => 'doom'
  def welcome
    #Welcomes user and asks for twitter topic
    system("clear")
    puts @@doh.asciify('       Welcome To').red
    puts @@doh.asciify('    TweetTrend').light_cyan
    puts @@slant.asciify('                                        Click Enter To Continue').red.blink
    puts ("                                                                                                          #########################################################")
    puts ("                                                                                                          #########################################################")
    puts ("                                                                                                          ###               Welcome to TweetTrend©              ###")
    puts ("                                                                                                          ###                                                   ###")
    puts ("                                                                                                          ###    The only command line app you'll ever need     ###")
    puts ("                                                                                                          ###" + "               TO SEE WHATS TRENDING!".red.blink + "              ###")
    puts ("                                                                                                          ###                                                   ###")
    puts ("                                                                                                          ###                                                   ###")
    puts ("                                                                                                          ###     Enter 'quit' at any time to exit the app      ###")
    puts ("                                                                                                          #########################################################")
    puts ("                                                                                                          #########################################################")
    response = gets.chomp
    exit if response == "quit"
    user_input
    # puts ("###            Enter any twitter topic,      ##")
    # puts ("###                  'Politics'                        ###")
    # puts ("and I'll be more than happy to show you what's trending:    ")
  end

  def user_input
    system("clear")
    puts @@slant.asciify("Enter A Topic Now :").magenta
    topic = gets.chomp
    topic = topic.downcase
    exit if topic == "quit"
    #Checks if user would like to specify a location
    puts @@slant.asciify("Would you also like to specify a location?  ' Yes ' or ' No '").light_cyan
    puts "This would allow you to see the treding tweets for your topic specifically from the users located within the given area.".yellow
    response = gets.chomp
    response = response.downcase
    exit if response == "quit"
    answer = [topic, response]
    check_answer(answer)
  end

  def check_answer(answer)
    if answer[1] == "yes" || answer[1] == "no"
      search(answer)
    else
      puts @@slant.asciify("Please reply with only 'Yes' or 'No' ").red
      response = gets.chomp
      response = response.downcase
      exit if response == "quit"
      answer[1] = response
      check_answer(answer)
    end
  end

  def search(answer)
    if answer[1] == "no"
      system("clear")
      puts @@slant.asciify("The TweetTrend Top 10 Tweets").light_cyan
      tweet_client = TwitterApi.new
      tweet_client.search(answer[0])
      puts @@slant.asciify("Click Enter To Continue").red.blink
      puts @@slant.asciify("OR")
      puts @@slant.asciify("Type Quit To Exit").blue.blink
      gets.chomp
      welcome
    else
      puts @@slant.asciify("Please Specify The Location Now :").green
      puts "Locations must not be large land mases like Countries OR States, \nThey must be cities, towns, or a famous place like the 'Eiffel Tower'".yellow
      location = gets.chomp
      location = Geocoder.search(location)[0].coordinates
      exit if location == "quit"
      system("clear")
      puts @@slant.asciify("The TweetTrend Top 10 Tweets").light_cyan
      tweet_client = TwitterApi.new
      tweet_client.specific_search(answer[0], location)
      puts @@slant.asciify("Click Enter To Continue").red.blink
      puts @@slant.asciify("OR")
      puts @@slant.asciify("Type Quit To Exit").blue.blink
      response = gets.chomp
      exit if response == "quit"
      welcome
    end
  end
end
