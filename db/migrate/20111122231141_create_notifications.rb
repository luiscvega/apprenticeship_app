class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :apprenticeship_id
      t.integer :message_id
      t.integer :resource_id
      t.integer :meetup_id

      t.timestamps
    end
  end
end
