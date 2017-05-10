#Top 5 most popular sport tweets
sports = Topic.create(topic_name: "sports")

kobe = Tweet.create(user: "Kobe Bryant", tweet: "Last night was the final chapter to an incredible story. I walk away at peace knowing my love for the game & this city will never be broken.", likes: 359144, date: "5:34 PM - 14 Apr 2016")
kobe.topics << sports

mcgregor = Tweet.create(user: "Conor McGregor", tweet: "I have decided to retire young. Thanks for the cheese. Catch ya's later.", likes: 194801, date: "2:29 PM - 19 Apr 2016")
mcgregor.topics << sports

lebron = Tweet.create(user: "LeBron James", tweet: "Love me or Hate me but at the end of the day u will RESPECT me!!", likes: 128789, date: "1:01 AM - 14 Apr 2016")
lebron.topics << sports

asmith = Tweet.create(user: "Stephen A Smith", tweet: "Don't give a damn what anyone says: weak move by KD. You go to GSW, the team who beat you, when you're already on a title contender? Please!", likes: 121945, date: "12:09 PM - 4 Jul 2016")
asmith.topics << sports

tyson = Tweet.create(user: "Mike Tyson", tweet: "God came for his champion. So long great one. @MuhammadAli #TheGreatest #RIP", likes: 117949, date: "12:54 AM - 4 Jun 2016")
tyson.topics << sports

#Top 5 most popular political tweets
politics = Topic.create(topic_name: "politics")

hillary = Tweet.create(user: "Hillary Clinton", tweet: "To all the little girls watching... never doubt that you are valuable and powerful & deserving of every chance & opportunity in the world.", likes: 1222192, date: "11:51 AM - 9 Nov 2016")
hillary.topics << politics

hillary2 = Tweet.create(user: "Hillary Clinton", tweet: "Delete your account. @realDonaldTrump", likes: 724405, date: "11:27 AM - 9 Jun 2016")
hillary2.topics << politics

trump = Tweet.create(user: "Donald J. Trump", tweet:"TODAY WE MAKE AMERICA GREAT AGAIN!", likes: 570659, date: "6:43 AM - 8 Nov 2016")
trump.topics << politics

biden = Tweet.create(user: "VP Biden", tweet: "Happy 55th, Barack! A brother to me, a best friend forever.", likes: 637593, date: "1:33 PM - 4 Aug 2016")
biden.topics << politics

obama = Tweet.create(user: "Barack Obama", tweet: "Four more years.", likes: 623454, date: "11:16 PM - 6 Nov 2012")
obama.topics << politics
