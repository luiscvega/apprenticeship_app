class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :relationship_id
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
end
