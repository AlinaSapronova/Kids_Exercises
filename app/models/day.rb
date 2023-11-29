# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Day < ApplicationRecord
  has_many  :exercises, class_name: "Exercise", foreign_key: "day_id"
  has_many  :challenges_days, class_name: "Challengeday", foreign_key: "day_id"

  has_many :challenges, through: :challenges_days, source: :challenge
end
