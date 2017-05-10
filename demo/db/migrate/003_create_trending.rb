class CreateTrending < ActiveRecord::Migration
  def change
    create_table :trendings do |t|
      t.references :tweet
      t.references :topic
    end
  end
end
