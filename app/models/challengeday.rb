# == Schema Information
#
# Table name: challengedays
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :integer
#  day_id       :integer
#
class Challengeday < ApplicationRecord
  belongs_to :challenge, class_name: "Challenge", foreign_key: "challenge_id"
  belongs_to :day, class_name: "Day", foreign_key: "day_id"
  has_many  :progresses, class_name: "Progress", foreign_key: "challenge_day_id"
end
