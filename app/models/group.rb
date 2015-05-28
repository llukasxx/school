class Group < ActiveRecord::Base
  validates :name, presence: true
  has_many :students
  has_many :group_lessons
  has_many :lessons, through: :group_lessons
  has_many :group_teachers
  has_many :teachers, through: :group_teachers
end
