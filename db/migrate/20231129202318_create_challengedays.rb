class CreateChallengedays < ActiveRecord::Migration[7.0]
  def change
    create_table :challengedays do |t|
      t.integer :challenge_id
      t.integer :day_id

      t.timestamps
    end
  end
end
