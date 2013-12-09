class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :flag_count
      t.integer :up_vote_count
      t.integer :down_vote_count

      t.timestamps
    end
  end
end
