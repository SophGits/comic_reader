class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :active, default: false
      t.integer :user_id
      t.integer :feed_id
      t.timestamps
    end
  end
end
