class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :feed_url_id
      t.integer :user_id

      t.timestamps
    end
  end
end
