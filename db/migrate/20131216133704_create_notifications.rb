class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
