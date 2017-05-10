class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :tweet
      t.integer :likes
      t.string :date
    end
  end
end
