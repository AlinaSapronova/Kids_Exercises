# == Schema Information
#
# Table name: progresses
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  challenge_day_id :integer
#  child_id         :integer
#
class Progress < ApplicationRecord
  belongs_to :child, class_name: "Child", foreign_key: "child_id"
  belongs_to :challenge_day, class_name: "Challengeday", foreign_key: "challenge_day_id"
end
