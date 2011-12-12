class AddRecipientIdToResource < ActiveRecord::Migration
  def change
    add_column :resources, :recipient_id, :integer
  end
end
