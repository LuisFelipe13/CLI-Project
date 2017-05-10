class Trending < ActiveRecord::Base
  belongs_to :topic
  belongs_to :tweet
end
