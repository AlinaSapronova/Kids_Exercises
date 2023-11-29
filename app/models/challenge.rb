# == Schema Information
#
# Table name: challenges
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Challenge < ApplicationRecord
  has_many  :challenge_days, class_name: "Challengeday", foreign_key: "challenge_id"
  has_many :days, through: :challenge_days, source: :day
end
