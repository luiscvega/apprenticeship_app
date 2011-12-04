class AddColumnsToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :notifiable_id, :integer
    add_column :notifications, :notifiable_type, :string
    remove_column :notifications, :message_id
    remove_column :notifications, :resource_id
    remove_column :notifications, :meetup_id
  end
end
