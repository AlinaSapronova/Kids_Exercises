class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name
      t.string :gender
      t.date :birthday
      t.integer :user_id

      t.timestamps
    end
  end
end
