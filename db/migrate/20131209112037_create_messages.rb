class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :recipient_id
      t.text :content
      t.boolean :is_read

      t.timestamps
    end
  end
end
