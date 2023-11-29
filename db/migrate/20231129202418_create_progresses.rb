class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.integer :challenge_day_id
      t.integer :child_id

      t.timestamps
    end
  end
end
