class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :active, default: true
      t.integer :user_id
      t.integer :strip_id
      t.integer :feed_id
      t.timestamps
    end
  end
end
