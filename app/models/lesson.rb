class Lesson < ActiveRecord::Base
  has_many :teacher_lessons, dependent: :destroy
  has_many :teachers, through: :teacher_lessons
  has_many :group_lessons
  has_many :groups, through: :group_lessons
  has_many :students, through: :groups
  validates :name, presence: true, length: {maximum: 100}
end
