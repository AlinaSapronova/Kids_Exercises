task sample_data: :environment do
  Day.destroy_all
  Exercise.destroy_all
  Challenge.destroy_all
  Challengeday.destroy_all

  CSV.foreach('lib/sample_data/days.csv', headers: true) do |row|
    day_data = row.to_hash
    Day.create(day_data)
  end

  puts "There are now #{Day.count} days "

  CSV.foreach('lib/sample_data/challenges.csv', headers: true) do |row|
    challenge_data = row.to_hash
    Challenge.create(challenge_data)
  end

  puts "Theere are now #{Challenge.count} challenges"


  CSV.foreach('lib/sample_data/exercises.csv', headers: true) do |row|
    exercise_data = row.to_hash
    Exercise.create(exercise_data)
  end

  puts "Theere are now #{Exercise.count} exercises"


  CSV.foreach('lib/sample_data/challengeDays.csv', headers: true) do |row|
    challenge_day_data = row.to_hash
    Challengeday.create(challenge_day_data)
  end

  puts "There are now #{Challengeday.count} exercises"
end
