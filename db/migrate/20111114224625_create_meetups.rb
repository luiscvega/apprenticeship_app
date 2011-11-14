class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.time :time
      t.string :venue
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
