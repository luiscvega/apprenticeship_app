class AddApprenticeshipIdToMeetup < ActiveRecord::Migration
  def change
    add_column :meetups, :apprenticeship_id, :integer
  end
end
