# == Schema Information
#
# Table name: children
#
#  id         :integer          not null, primary key
#  birthday   :date
#  gender     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Child < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many  :progresses, class_name: "Progress", foreign_key: "child_id"
end
