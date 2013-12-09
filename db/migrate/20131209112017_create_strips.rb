class CreateStrips < ActiveRecord::Migration
  def change
    create_table :strips do |t|
      t.string :strip_url
      t.string :keywords
      t.integer :flag_count
      t.integer :up_vote_count
      t.integer :down_vote_count

      t.timestamps
    end
  end
end
