class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :title
      t.string :video
      t.integer :day_id

      t.timestamps
    end
  end
end
