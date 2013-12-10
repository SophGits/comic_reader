class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :logo
      t.string :main_url
      t.string :feed_url
      t.string :keywords
      t.string :summary
      t.string :author
      t.integer :flag_count
      t.integer :up_vote_count
      t.integer :down_vote_count

      t.timestamps
    end
  end
end
