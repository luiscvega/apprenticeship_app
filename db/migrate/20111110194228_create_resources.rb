class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :link
      t.text :description
      t.integer :user_id
      t.integer :apprenticeship_id

      t.timestamps
    end
  end
end
