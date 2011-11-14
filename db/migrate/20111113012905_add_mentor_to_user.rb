class AddMentorToUser < ActiveRecord::Migration
  def change
    add_column :users, :mentor, :boolean, :default => true
  end
end
