class Topic < ActiveRecord::Base
  has_many :trendings
  has_many :tweets, through: :trendings

  def self.check_for_topic(response)
    Topic.all.collect do |topic_obj|
      topic = topic_obj.topic_name
      return response if topic_obj.topic_name == response
    end
  end

  def self.show_tweets(response)
    id = Topic.where(topic_name: response).ids
    tweet_array = Trending.where(topic_id: id[0]).pluck(:tweet_id)
    answer = Tweet.find(tweet_array)
    tweets = answer.map do |t|
              "user: #{t.user} tweet: #{t.tweet}"
            end
    puts tweets
  end

end
