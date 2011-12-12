class AddRecipientIdToMeetup < ActiveRecord::Migration
  def change
    add_column :meetups, :recipient_id, :integer
  end
end
