class Lesson < ActiveRecord::Base
  has_many :group_lessons
  has_many :groups, through: :group_lessons
  has_many :group_teachers, through: :groups
  has_many :teachers, through: :group_teachers
  has_many :students, through: :groups
  validates :name, presence: true, length: {maximum: 100}
end
