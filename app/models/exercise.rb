# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  title      :string
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_id     :integer
#
class Exercise < ApplicationRecord
  belongs_to :day,  class_name: "Day", foreign_key: "day_id"
end
