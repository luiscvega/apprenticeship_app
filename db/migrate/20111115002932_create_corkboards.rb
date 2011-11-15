class CreateCorkboards < ActiveRecord::Migration
  def change
    create_table :corkboards do |t|
      t.integer :apprenticeship_id
      t.text :notes

      t.timestamps
    end
  end
end
