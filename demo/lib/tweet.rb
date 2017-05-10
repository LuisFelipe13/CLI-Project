class Tweet < ActiveRecord::Base
  has_many :trendings
  has_many :topics, through: :trendings
end
